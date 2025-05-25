import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ), // Make back icon black
          title: const Text(
            "Notifications",
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [Tab(text: 'Inbox'), Tab(text: 'Offers')],
          ),
        ),
        body: const TabBarView(children: [InboxTab(), OffersTab()]),
      ),
    );
  }
}

class InboxTab extends StatelessWidget {
  const InboxTab({super.key});

  @override
  Widget build(BuildContext context) {
    final inboxMessages = [
      {
        'title': 'Order #1234 Shipped',
        'subtitle': 'Your order has been shipped and is on the way!',
        'icon': Icons.local_shipping,
      },
      {
        'title': 'Payment Received',
        'subtitle': 'We have received your payment for order #1234.',
        'icon': Icons.payment,
      },
      {
        'title': 'Order Delivered',
        'subtitle': 'Your order #1234 has been delivered successfully.',
        'icon': Icons.check_circle,
      },
      {
        'title': 'Cart Reminder',
        'subtitle': 'You left items in your cart. Complete your purchase now!',
        'icon': Icons.shopping_cart,
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: inboxMessages.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final message = inboxMessages[index];
        return ListTile(
          // leading: Icon(message['icon'] as IconData, color: Colors.blue),
          title: Text(
            message['title'] as String,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(message['subtitle'] as String),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // TODO: Add navigation or detail logic
          },
        );
      },
    );
  }
}

class OffersTab extends StatelessWidget {
  const OffersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = [
      {
        'image':
            'https://cdn.dribbble.com/userupload/24504622/file/original-ed16c81d6bd952e6ca9a061d5709e8eb.png?resize=400x0',
        'title': 'Flat 50% Off on Shoes',
        'description': 'Grab your favorite brands before the offer ends!',
      },
      {
        'image':
            'https://t4.ftcdn.net/jpg/02/49/50/15/360_F_249501541_XmWdfAfUbWAvGxBwAM0ba2aYT36ntlpH.jpg',
        'title': 'Summer Sale!',
        'description': 'Up to 70% off on clothing & accessories.',
      },
      {
        'image':
            'https://img.freepik.com/free-vector/flat-black-friday-horizontal-sale-banner_23-2149115134.jpg?semt=ais_hybrid&w=740',
        'title': 'Buy 1 Get 1 Free',
        'description': 'On select items from our electronics collection.',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: offers.length,
      itemBuilder: (context, index) {
        final offer = offers[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  offer['image']!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      offer['description']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
