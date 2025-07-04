import 'package:fleetsynctechnology/role_driver/Truck%20Sales/presentation/widgets/create_sales_post.dart';
import 'package:fleetsynctechnology/role_driver/Truck%20Sales/presentation/widgets/truck_sales_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';


class TruckSalesPage extends StatelessWidget {
  const TruckSalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark
        ? AppColors.primaryTextOnDark
        : AppColors.primaryTextOnLight;

    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom TabBar
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TabBar(
              labelColor: AppColors.themeGreen,
              unselectedLabelColor: textColor,
              indicatorColor: AppColors.themeGreen,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              tabs: const [
                Tab(text: 'Truck Sales Posts'),
                Tab(text: 'Create Sale Post'),
              ],
            ),
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              children: const [
                TruckSalesListWidget(),
                CreateSalesPostWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
