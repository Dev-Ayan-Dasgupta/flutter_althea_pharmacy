import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/order_entity.dart';

class NewOrderBanner extends StatefulWidget {
  final OrderEntity order;
  final VoidCallback onDismiss;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const NewOrderBanner({
    super.key,
    required this.order,
    required this.onDismiss,
    required this.onAccept,
    required this.onReject,
  });

  @override
  State<NewOrderBanner> createState() => _NewOrderBannerState();
}

class _NewOrderBannerState extends State<NewOrderBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _dismiss() {
    _controller.reverse().then((_) {
      widget.onDismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEmergency = widget.order.priority == OrderPriority.emergency;
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: size.width,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: isEmergency
                  ? AppColors.errorGradient
                  : AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: (isEmergency ? AppColors.error : AppColors.primaryDark)
                      .withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Animated ripple effect
                if (isEmergency) _buildPulseEffect(),

                // Content
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          // Icon with animation
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 800),
                            builder: (context, value, child) {
                              return Transform.rotate(
                                angle: value * 0.1,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isEmergency
                                        ? Icons.local_hospital
                                        : Icons.shopping_bag,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(width: 16),

                          // Title
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isEmergency
                                      ? '🚨 EMERGENCY ORDER!'
                                      : '🔔 New Order Received',
                                  style: AppTypography.headlineSmall(
                                    Colors.white,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  widget.order.orderId,
                                  style: AppTypography.bodyMedium(
                                    Colors.white.withValues(alpha: 0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Close button
                          IconButton(
                            onPressed: _dismiss,
                            icon: const Icon(Icons.close, color: Colors.white),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Order Details
                      _buildDetailRow(
                        Icons.person,
                        'Customer',
                        widget.order.customerName,
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow(
                        Icons.medication,
                        'Items',
                        '${widget.order.items.length} medicines',
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow(
                        Icons.account_balance_wallet,
                        'Amount',
                        widget.order.totalAmount.toCurrency(),
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow(
                        Icons.location_on,
                        'Distance',
                        '${widget.order.distance.toStringAsFixed(1)} km away',
                      ),

                      const SizedBox(height: 24),

                      // Action Buttons
                      Row(
                        children: [
                          // Reject Button
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                _controller.reverse().then((_) {
                                  widget.onReject();
                                });
                              },
                              icon: const Icon(Icons.cancel_outlined),
                              label: const Text('Reject'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          // View Details Button
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _dismiss();
                                context.go('/home/order/${widget.order.id}');
                              },
                              icon: const Icon(Icons.visibility),
                              label: const Text('View'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: isEmergency
                                    ? AppColors.error
                                    : AppColors.primaryDark,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Accept Button
                          Expanded(
                            flex: 2,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _controller.reverse().then((_) {
                                  widget.onAccept();
                                });
                              },
                              icon: const Icon(Icons.check_circle),
                              label: const Text('Accept'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.success,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.caption(
                  Colors.white.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTypography.bodyMedium(
                  Colors.white,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPulseEffect() {
    return Positioned.fill(child: _PulseAnimation());
  }
}

class _PulseAnimation extends StatefulWidget {
  const _PulseAnimation();

  @override
  State<_PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<_PulseAnimation> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      builder: (context, value, child) {
        _value = value;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.5 * (1 - value)),
              width: 3 + (6 * value),
            ),
          ),
        );
      },
      onEnd: () {
        // Restart animation by rebuilding
        if (mounted) {
          setState(() {});
        }
      },
    );
  }
}
