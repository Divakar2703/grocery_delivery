import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/view_model_order_list_food.dart';

class PaymentModeDialog extends StatefulWidget {
  final Function(String selectedValue) onConfirm;

  const PaymentModeDialog({
    required this.onConfirm,
    Key? key,
  }) : super(key: key);

  @override
  _PaymentModeDialogState createState() => _PaymentModeDialogState();
}

class _PaymentModeDialogState extends State<PaymentModeDialog> {
  late OrderListFoodViewModel orderListViewModel;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();

    orderListViewModel = OrderListFoodViewModel();
    orderListViewModel.getPayType(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderListFoodViewModel>.value(
      value: orderListViewModel,
      child: Consumer<OrderListFoodViewModel>(
        builder: (context, value, _) {
          if (value.getPayTypeResData.data != null) {
            return AlertDialog(
              title: const Text('Choose Payment Mode'),
              content: Container(
                height: 200,
                constraints: BoxConstraints(maxHeight: 300), // Set a maximum height
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.getPayTypeResData.data?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    var data = value.getPayTypeResData.data?.data?[index];
                     if(data?.status=="1"){
                       return RadioListTile<String>(
                        title: Text(value.getPayTypeResData.data?.data?[index].type ?? ""),
                        value: value.getPayTypeResData.data?.data?[index].type ?? "",
                        groupValue: _selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                      );
                    }
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_selectedValue != null) {
                      widget.onConfirm(_selectedValue!);
                      Navigator.of(context).pop();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Please select an option.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Confirm'),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}