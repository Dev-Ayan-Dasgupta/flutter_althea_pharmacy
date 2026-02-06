import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';

class WithdrawDialog extends StatefulWidget {
  final double availableBalance;
  final Function(double) onWithdraw;

  const WithdrawDialog({
    super.key,
    required this.availableBalance,
    required this.onWithdraw,
  });

  @override
  State<WithdrawDialog> createState() => _WithdrawDialogState();
}

class _WithdrawDialogState extends State<WithdrawDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  bool _isProcessing = false;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.account_balance,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Withdraw Funds',
            style: AppTypography.titleLarge(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
        ],
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.account_balance_wallet,
                    size: 16,
                    color: AppColors.success,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Available Balance: ${widget.availableBalance.toCurrency()}',
                    style: AppTypography.bodyMedium(AppColors.success),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Withdrawal Amount',
                hintText: 'Enter amount',
                prefixText: '₹ ',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                final amount = double.tryParse(value);
                if (amount == null) {
                  return 'Invalid amount';
                }
                if (amount < 100) {
                  return 'Minimum withdrawal is ₹100';
                }
                if (amount > widget.availableBalance) {
                  return 'Insufficient balance';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Quick Amount Buttons
            Wrap(
              spacing: 8,
              children: [500, 1000, 2000, 5000].map((amount) {
                return ActionChip(
                  label: Text('₹$amount'),
                  onPressed: amount <= widget.availableBalance
                      ? () => _amountController.text = amount.toString()
                      : null,
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 16,
                    color: AppColors.info,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Funds will be transferred to your registered bank account within 24 hours',
                      style: AppTypography.caption(AppColors.info),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isProcessing ? null : () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isProcessing ? null : _handleWithdraw,
          child: _isProcessing
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Withdraw'),
        ),
      ],
    );
  }

  Future<void> _handleWithdraw() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isProcessing = true);

      final amount = double.parse(_amountController.text);
      await widget.onWithdraw(amount);

      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }
}
