part of 'vendor_stats_cubit.dart';

class VendorStatsState extends Equatable {
  final double? totalEarnings;
  final int? totalOrders;
  final int? totalProducts;
  final int? totalCustomers;
  final String? status; // e.g. loading, success, failure

  const VendorStatsState({
    this.totalEarnings,
    this.totalOrders,
    this.totalProducts,
    this.totalCustomers,
    this.status,
  });

  @override
  List<Object?> get props => [
        totalEarnings,
        totalOrders,
        totalProducts,
        totalCustomers,
        status,
      ];
}
