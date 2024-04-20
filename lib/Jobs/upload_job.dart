import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../Persistent/persistent.dart';
import '../Services/global_methods.dart';
import '../Widgets/bottom_nav_bar.dart';

class UploadJobNow extends StatefulWidget {

  @override
  State<UploadJobNow> createState() => _UploadJobNowState();
}

class _UploadJobNowState extends State<UploadJobNow> {

  final TextEditingController _jobCategoryController = TextEditingController(text: 'Select Job Category');
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _jobDescriptionController = TextEditingController();
  final TextEditingController _deadlineDateController = TextEditingController(text: 'Job Deadline Date');


  final _formKey = GlobalKey<FormState>();
  DateTime? picked;
  Timestamp? deadlineDateTimeStamp;
  bool _isloading = false;

  Widget _textTitles({required String label}){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
      ),
    );
  }

  Widget _textFormFields({
    required String valueKey,
    required TextEditingController controller,
    required bool enabled,
    required Function fct,
    required int maxLength,
  })
  {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: (){
          fct();
        },
        child: TextFormField(
          validator: (value){
            if(value!.isEmpty)
            {
              return 'Value is Missing';
            }
            return null;
          },
          controller: controller,
          enabled: enabled,
          key: ValueKey(valueKey),
          style: const TextStyle(
            color: Colors.white,
          ),
          maxLines: valueKey == 'JobDescription' ? 3 : 1,
          maxLength: maxLength,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.black54,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }

  _showTaskCategoriesDialog({required Size size})
  {
    showDialog(
        context: context,
        builder: (ctx)
        {
          return AlertDialog(
            backgroundColor: Colors.black54,
            title: const Text(
              'Job Category',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Persistent.jobCategoryList.length,
                  itemBuilder: (ctx, index){
                    return InkWell(
                      onTap: (){
                        setState(() {
                          _jobCategoryController.text = Persistent.jobCategoryList[index];
                        });
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_right_alt_outlined,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Persistent.jobCategoryList[index],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
            actions: [
              TextButton(
                onPressed: ()
                {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text('Cancel', style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                ),
              ),
            ],
          );
        }
    );
  }

  void _pickDateDialog() async
  {
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        Duration(days: 0),
      ),
      lastDate: DateTime(2100),
    );
    if(picked != null)
    {
      setState(() {
        _deadlineDateController.text = '${picked!.year} - ${picked!.month} - ${picked!.day}';
        deadlineDateTimeStamp = Timestamp.fromMicrosecondsSinceEpoch(picked!.microsecondsSinceEpoch);
      });
    }
  }

  void _uploadTask() async{
    final jodId = const Uuid().v4();
    User? user = FirebaseAuth.instance.currentUser;
    final _uid = user!.uid;
    final isValid = _formKey.currentState!.validate();

    if(isValid)
    {
      if(_deadlineDateController.text == 'Choose Job Deadline Date' || _jobCategoryController.text == 'Choose Job Category')
      {

        GlobalMethod.showErrorDialog(
            error: 'Please pick everything',
            ctx: context
        );
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.deepOrange.shade300, Colors.blueAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.2, 0.9],
          ),
      ),
      child: Scaffold(
       bottomNavigationBar: BottomNavigationBarForApp(indexNum: 2,),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Upload Job Now'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[Colors.deepOrange.shade300, Colors.blueAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [0.2, 0.9],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
