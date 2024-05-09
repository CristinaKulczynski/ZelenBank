import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zelenbank/core/share_image/share_image.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/common/custom_app_bar_widget.dart';
import '../../../../../core/injector/injector.dart';
import '../../common/custom_alert_dialog.dart';
import '../../common/custom_button_widget.dart';
import '../components/transaction_details_field_widget.dart';
import '../components/transaction_details_loading_widget.dart';

class TransactionDetails extends StatefulWidget {
  final String id;

  const TransactionDetails(this.id, {Key? key}) : super(key: key);

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  final TransactionController _transactionController =
      serviceLocator.get<TransactionController>();

  GlobalKey previewContainer = GlobalKey();

  @override
  void initState() {
    _transactionController.currentState = States.idle;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _transactionController.getTransactionById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBarWidget(leading: CustomBackButton()),
      body: AnimatedBuilder(
        animation: _transactionController,
        builder: (context, snapshot) {
          if (_transactionController.currentState == States.loading) {
            return Padding(
              padding: const EdgeInsets.only(top: 45),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const TransactionDetailsLoadingWidget();
                },
                itemCount: 8,
              ),
            );
          } else if (_transactionController.currentState == States.success) {
            TransactionEntity data =
                _transactionController.detailedTransaction!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RepaintBoundary(
                      key: previewContainer,
                      child: Container(
                        color: theme.scaffoldBackgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Comprovante',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(
                                thickness: 2.2,
                                height: 25,
                              ),
                              TransactionDetailsFieldWidget(
                                fieldTitle: 'Tipo de movimentação',
                                fieldDescription: data.description,
                              ),
                              TransactionDetailsFieldWidget(
                                fieldTitle: 'Valor',
                                fieldDescription:
                                    'R\$ ${transactionFormattedValue(data.amount)}',
                              ),
                              TransactionDetailsFieldWidget(
                                fieldTitle:
                                    _transactionController.isReceived(data)
                                        ? 'Pagador'
                                        : 'Recebedor',
                                fieldDescription: data.targetName,
                              ),
                              data.bankName != null
                                  ? TransactionDetailsFieldWidget(
                                      fieldTitle: 'Instituição bancária',
                                      fieldDescription: data.bankName!,
                                    )
                                  : Container(),
                              TransactionDetailsFieldWidget(
                                fieldTitle: 'Data/Hora',
                                fieldDescription:
                                    DateFormat('d/MM/yyyy - HH:mm:ss')
                                        .format(data.createdAt),
                              ),
                              TransactionDetailsFieldWidget(
                                fieldTitle: 'Autenticação',
                                fieldDescription: data.authentication!,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: CustomButtonWidget(
                        label: 'Compartilhar',
                        previewContainer: previewContainer,
                        onTap: () {
                          return shareImage(previewContainer);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (_transactionController.currentState == States.error) {
            Future.delayed(Duration.zero, () {
              return showAlertDialog(context);
            });
          }
          return Container();
        },
      ),
    );
  }

  String transactionFormattedValue(double value) {
    return value.toStringAsFixed(2).replaceAll('.', ',');
  }
}
