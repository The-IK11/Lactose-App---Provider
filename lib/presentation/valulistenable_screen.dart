import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ValulistenableScreen extends StatelessWidget {
 ValulistenableScreen({super.key});

  
 ValueNotifier<int>counter=ValueNotifier<int>(0);
 ValueNotifier<bool>isObsecure=ValueNotifier<bool>(false);
 FocusNode focusNode=FocusNode();

void closeFocus(){
  if(focusNode.hasFocus){
    focusNode.unfocus();
  }
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeFocus,
      child: Scaffold(
         floatingActionButton: FloatingActionButton(onPressed:(){counter.value++;}, child: Icon(Icons.add),),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title:  Text('ValueListenableBuilder',style:GoogleFonts.pottaOne(color: Colors.white, fontSize: 24) ,),
      
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        //Obsecure text 
      
    ValueListenableBuilder(valueListenable:isObsecure , builder: (context, value,child){
      return   TextFormField(
      focusNode: focusNode,
      obscureText: isObsecure.value,
      
      obscuringCharacter: '*',
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: (){isObsecure.value = !isObsecure.value;}, icon: isObsecure.value? const Icon(Icons.visibility_off): const Icon(Icons.visibility)),
        labelText: 'Password',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2.0)
          
        ),
      ),
        );
    }),

        
      
      ///Counter test
            Center(
              child: ValueListenableBuilder(valueListenable: counter, builder: (context,value,child){
                return Text(
                value.toString(),
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              );
              })
            ),
          ],
        ),
      ),
    );
  }
}