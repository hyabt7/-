import 'package:flutter/material.dart';

void main() {
  runApp(const HaybatAdsApp());
}

class HaybatAdsApp extends StatelessWidget {
  const HaybatAdsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HAYBAT ADS AI PRO',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0B14),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF985CFF),
          brightness: Brightness.dark,
        ),
      ),
      home: const AdsHomePage(),
    );
  }
}

class AdsHomePage extends StatefulWidget {
  const AdsHomePage({super.key});

  @override
  State<AdsHomePage> createState() => _AdsHomePageState();
}

class _AdsHomePageState extends State<AdsHomePage> {
  final TextEditingController productController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  String adType = 'إعلان عطور';
  String duration = '15 ثانية';
  String format = 'عمودي - TikTok و Reels';
  String style = 'سينمائي واقعي';

  String result = '';

  @override
  void dispose() {
    productController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Widget inputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int lines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: controller,
        maxLines: lines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFF171725),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  Widget choiceField({
    required String label,
    required String value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xFF171725),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        items: options.map((option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(
              option,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  void createAdPlan() {
    final product = productController.text.trim();
    final description = descriptionController.text.trim();

    if (product.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('اكتب اسم المنتج ووصفه أولاً'),
        ),
      );
      return;
    }

    setState(() {
      result = '''
اسم المنتج: $product

نوع الإعلان: $adType

أسلوب الفيديو: $style

مدة الفيديو: $duration

صيغة الفيديو: $format

وصف المنتج:
$description

مخطط الإعلان:
لقطة افتتاحية سينمائية تعرض المنتج بوضوح.
لقطة ثانية تبرز تفاصيل المنتج.
لقطة أخيرة تعرض اسم المنتج والعبارة الإعلانية.

حالة المشروع: تم إعداد مخطط الإعلان.
الفيديو الحقيقي يحتاج ربط خدمة توليد فيديو بالذكاء الاصطناعي.
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HAYBAT ADS AI PRO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF17132D),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF302052),
                    Color(0xFF171725),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.movie_creation_outlined,
                    size: 48,
                    color: Color(0xFFC6A5FF),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'اصنع إعلانك القادم',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'استوديو إعلاني ذكي للمشاريع والمنتجات',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'معلومات الإعلان',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            inputField(
              label: 'اسم المنتج',
              hint: 'مثلاً: عطر هيبت',
              controller: productController,
            ),

            inputField(
              label: 'وصف المنتج',
              hint: 'اكتب مميزات المنتج وتفاصيله',
              controller: descriptionController,
              lines: 4,
            ),

            choiceField(
              label: 'نوع الإعلان',
              value: adType,
              options: const [
                'إعلان عطور',
                'إعلان مطعم',
                'إعلان ملابس',
                'إعلان إلكترونيات',
                'إعلان سيارات',
                'إعلان عقارات',
                'إعلان مخصص',
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => adType = value);
                }
              },
            ),

            choiceField(
              label: 'أسلوب الفيديو',
              value: style,
              options: const [
                'سينمائي واقعي',
                'فاخر',
                'تجاري سريع',
                'إبداعي',
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => style = value);
                }
              },
            ),

            choiceField(
              label: 'مدة الإعلان',
              value: duration,
              options: const [
                '8 ثوانٍ',
                '15 ثانية',
                '30 ثانية',
                '60 ثانية',
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => duration = value);
                }
              },
            ),

            choiceField(
              label: 'حجم الفيديو',
              value: format,
              options: const [
                'عمودي - TikTok و Reels',
                'أفقي - YouTube',
                'مربع - منشورات',
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => format = value);
                }
              },
            ),

            const SizedBox(height: 5),

            FilledButton.icon(
              onPressed: createAdPlan,
              icon: const Icon(Icons.auto_awesome),
              label: const Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  'إنشاء مخطط الإعلان',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            if (result.isNotEmpty) ...[
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF171725),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFF7650B8),
                  ),
                ),
                child: SelectableText(
                  result,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.8,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'صُنع بكل حب بواسطة هيبت ❤️',
                style: TextStyle(color: Colors.white60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}