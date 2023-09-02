import 'package:advertify_bot/features/ads_copy_generator/domain/entities/ads_copy_entity.dart';
import 'package:advertify_bot/features/ads_copy_generator/presentation/cubit/ads_copy_generator_cubit.dart';
import 'package:advertify_bot/features/ads_copy_generator/presentation/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class AdsCopyGeneratePage extends StatefulWidget {
  const AdsCopyGeneratePage({Key? key}) : super(key: key);

  @override
  State<AdsCopyGeneratePage> createState() => _AdsCopyGeneratePageState();
}

class _AdsCopyGeneratePageState extends State<AdsCopyGeneratePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();

  String _productGeneratedCopy = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _targetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advertify Bot"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Get promotional copy for your products Fast",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Powered By AI 🤖",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  textEditingController: _nameController,
                  label: "Product Name",
                  hint: "e.g book",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  textEditingController: _descriptionController,
                  label: "Description",
                  hint: "e.g amazing book",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  textEditingController: _targetController,
                  label: "Target market",
                  hint: "e.g under 12",
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo),foregroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    if (_nameController.text.isEmpty ||
                        _descriptionController.text.isEmpty ||
                        _targetController.text.isEmpty) {
                      return;
                    }

                    context.read<AdsCopyGeneratorCubit>().getAdsCopy(
                          adsCopyEntity: AdsCopyEntity(
                            _nameController.text,
                            _descriptionController.text,
                            _targetController.text,
                          ),
                        );
                  },
                  child: const Text("Generate Copy"),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<AdsCopyGeneratorCubit, AdsCopyGeneratorState>(
                    builder: (context, adsState) {
                      if (adsState is AdsCopyGeneratorLoading){
                        return const LinearProgressIndicator();
                      }
                  if (adsState is AdsCopyGeneratorLoaded) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 30),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 2,
                          color: Colors.indigo,
                        )),
                        child: Column(
                          children: [
                            Text(adsState.adsCopyGenerator.choices.first.text,style: const TextStyle(fontSize: 16),),
                            TextButton(
                                style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white),backgroundColor: MaterialStateProperty.all(Colors.indigo)),
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                      text: adsState
                                          .adsCopyGenerator.choices.first.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ad is copied",style: TextStyle(color: Colors.white),),backgroundColor: Colors.indigo,));
                                },
                                child: const Text(
                                  "Copy to clipboard!",
                                  style: TextStyle(fontSize: 14,color: Colors.white),
                                )),
                          ],
                        ));
                  }
                  return Container();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearTextField() {
    setState(() {
      _nameController.clear();
      _descriptionController.clear();
      _targetController.clear();
    });
  }
}
