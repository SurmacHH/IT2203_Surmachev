import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Общежития КубГАУ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const DormitoryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DormitoryScreen extends StatefulWidget {
  const DormitoryScreen({super.key});

  @override
  State<DormitoryScreen> createState() => _DormitoryScreenState();
}

class _DormitoryScreenState extends State<DormitoryScreen> {
  int _heartCounter = 0; // Начальное значение счётчика
  final String imageUrl = 'https://sun1-86.userapi.com/s/v1/if2/Zrr8Tpt0srq40rxIFt_GlDzXxycmDaomdZHiNhCvrVWjPzlbQWVB9bxy5NjUDgAKMyaTxAyX4VOZp48Fn2Wz7ITv.jpg?quality=96&crop=362,194,609,609&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540&ava=1&cs=240x240';

  void _incrementHeart() {
    setState(() {
      _heartCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Общежития КубГАУ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: 250,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: HeartCounter(
                    count: _heartCounter,
                    onPressed: _incrementHeart,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Общежитие №20',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Краснодар, ул. Калинина, 13',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(Icons.call, 'ПОЗВОНИТЬ'),
                      _buildActionButton(Icons.directions, 'МАРШРУТ'),
                      _buildActionButton(Icons.share, 'ПОДЕЛИТЬСЯ'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что состав-ляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в об-щежитии полностью. В соответствии  с Положением о студенческих общежитияхуниверситета, при поселении между администрацией и студентами заключаетсядоговор найма жилого помещения. Воспитательная работа в общежитиях направ-лена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствияасоциальных  явлений  в  молодежной  среде.  Условия  проживания  в  общежитияхуниверситетского  кампуса  полностью  отвечают  санитарным  нормам  и  требова-ниям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных за-лов,  комнат  самоподготовки,  помещений для  заседаний  студенческих  советов  инаглядной агитации. С целью улучшения условий быта студентов активно работаетсистема студенческого самоуправления  -  студенческие советы организуют всю ра-боту по самообслуживанию.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.green),
      label: Text(label),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}

class HeartCounter extends StatelessWidget {
  final int count;
  final VoidCallback onPressed;

  const HeartCounter({
    super.key,
    required this.count,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 24,
            ),
            const SizedBox(width: 4),
            Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}