import 'package:flutter/material.dart';
//Active.dart
class TripDetailScreen extends StatefulWidget {
  const TripDetailScreen({Key? key}) : super(key: key);

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tokyo Adventure'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(icon: Icon(Icons.list_alt), text: 'Itinerary'),
            Tab(icon: Icon(Icons.attach_money), text: 'Expenses'),
            Tab(icon: Icon(Icons.photo_library), text: 'Photos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildItineraryTab(),
          _buildExpensesTab(),
          _buildPhotosTab(),
        ],
      ),
    );
  }

  // ITINERARY TAB
  Widget _buildItineraryTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDaySection('Day 1 - January 15', [
          _buildItineraryItem(
            'Senso-ji Temple',
            '9:00 AM - 11:00 AM',
            Icons.temple_buddhist,
            Colors.blue,
          ),
          _buildItineraryItem(
            'Nakamise Shopping Street',
            '11:30 AM - 1:00 PM',
            Icons.shopping_bag,
            Colors.orange,
          ),
          _buildItineraryItem(
            'Lunch at Asakusa',
            '1:00 PM - 2:30 PM',
            Icons.restaurant,
            Colors.red,
          ),
        ]),
        const SizedBox(height: 16),
        _buildDaySection('Day 2 - January 16', [
          _buildItineraryItem(
            'Tsukiji Outer Market',
            '8:00 AM - 10:00 AM',
            Icons.local_dining,
            Colors.green,
          ),
          _buildItineraryItem(
            'Imperial Palace Gardens',
            '11:00 AM - 1:00 PM',
            Icons.nature,
            Colors.teal,
          ),
        ]),
      ],
    );
  }

  Widget _buildDaySection(String day, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...items,
      ],
    );
  }

  Widget _buildItineraryItem(
    String title,
    String time,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(time),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ),
    );
  }

  // EXPENSES TAB
  Widget _buildExpensesTab() {
    return Column(
      children: [
        // Add Expense Button
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.blue.shade50,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showAddExpenseDialog(),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Expense'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Summary Card
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade400, Colors.blue.shade600],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const Text(
                'Total Spent',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '¥45,670',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildExpenseStat('Your Share', '¥15,223'),
                  _buildExpenseStat('Per Person', '¥15,223'),
                ],
              ),
            ],
          ),
        ),

        // Expense List
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildExpenseItem(
                'Dinner at Sushi Restaurant',
                '¥12,000',
                'Food',
                Icons.restaurant,
                Colors.red,
                'Jan 15',
              ),
              _buildExpenseItem(
                'Tokyo Metro Day Pass',
                '¥1,200',
                'Transport',
                Icons.train,
                Colors.orange,
                'Jan 15',
              ),
              _buildExpenseItem(
                'Senso-ji Temple Souvenir',
                '¥3,500',
                'Shopping',
                Icons.shopping_bag,
                Colors.purple,
                'Jan 15',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseStat(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseItem(
    String title,
    String amount,
    String category,
    IconData icon,
    Color color,
    String date,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('$category • $date'),
        trailing: Text(
          amount,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showAddExpenseDialog() {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
                prefixText: '¥ ',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Add expense logic
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  // PHOTOS TAB
  Widget _buildPhotosTab() {
    return Column(
      children: [
        // Add Photo Button
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.blue.shade50,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showAddPhotoDialog(),
                  icon: const Icon(Icons.add_a_photo),
                  label: const Text('Add Photos'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Photo Grid
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.primaries[index % Colors.primaries.length].shade300,
                      Colors.primaries[index % Colors.primaries.length].shade600,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8),
                    child: const Center(
                      child: Icon(
                        Icons.photo,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showAddPhotoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Photos'),
        content: const Text(
          'Choose photos from your gallery or take new ones.\n\n'
          'Gemini will automatically filter and sort them for you!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.photo_library),
            label: const Text('Choose'),
          ),
        ],
      ),
    );
  }
}