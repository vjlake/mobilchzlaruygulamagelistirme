import 'package:flutter/material.dart';
//projenin ana kısmı 
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'no:022010201001',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Yasin Demirel '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List cumiov=[];
  firestoureService mfirservid=firestoureService();

  List<Widget> tileadlari = [
    ListTile(  title:Text("kitaplar") ,trailing: Row(children: [ IconButton.filled(onPressed: (){}, icon: Icon(Icons.arrow_drop_down))
      ,IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down)),
      ]
      ), )

  ];
  void guncelle(){
    setState(() {
    });
  }
  void ilkkurulum(int km){
    
    

    
    tileadlari = [
    ListTile(  title:Text("KITAPLAR")  ,trailing: IconButton(tooltip: "güncelle",onPressed:guncelle,icon: Icon(Icons.update), ),)

  ];
    
    for (List x in mfirservid.oku()){if(x[x.length-2] ){
      int bulo =x.length;

      
        tileadlari.add(ListTile(
        title: Text(x[0]),
        subtitle: Text("Yazar:${x[2]},"+"Sayfa Sayisi:${x[3]}"),
        trailing: IconButton(onPressed: ()async{List cumiolu=await Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>seccondpage(ind:x[bulo-1],kitveri:x,)));
        cumiov=cumiolu;
        if (cumiov.length>0){
      if (cumiolu[0]==0){
        
        {
          mfirservid.sil(cumiolu[1]);
        cumiov=[];
        _counter--;
        setState(() {
          
        });
        };


      };
      if (cumiolu[0]==1){
        
        {int deli=cumiolu[1].length;
        mfirservid.guncelle(cumiolu[1][deli-1], cumiolu[1]);
        cumiov=[];
        setState(() {
          
        });
        };
      };
   
      


    };

        },
      icon: Icon(Icons.edit),),
      ))
      ;
      }
    }
    


  }
  void tilerff(int islem,List degerlist){
    if (islem==0){
      setState(() {
      mfirservid.ekle(degerlist,
      );      
    }
    );
    }
    if (islem==1){setState(() {
      mfirservid.guncelle(degerlist.length-1,degerlist);
    });
      
    }
    if (islem==2){
      setState(() {
        mfirservid.sil(degerlist[degerlist.length-1]);
      });
    }




  }

  void incrementCounter() {
   
    setState(() {
      
      _counter++;
      

      
    });
   

  }
 

  @override
  Widget build(BuildContext context) {
    ilkkurulum(3);
    

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
        shadowColor: Color.fromARGB(0, 176, 152, 12)
      ),
      body: Center(

        child: Column(
          children: tileadlari,


        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()async{

           List veri=await Navigator.push(context,MaterialPageRoute(builder: (context)=>seccondpage(ind: _counter, kitveri: [])))
          
          ;_counter++;
          if(veri[0]==1){
            tilerff(0,veri[1]);

          }
        },
        tooltip: 'Kitap ekle',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
class seccondpage extends StatefulWidget{ 
late int indisi;
late List megaveri;
 seccondpage({super.key,required int ind,required List kitveri}){
  indisi=ind;
  megaveri=kitveri;
 }

  @override
  State<seccondpage> createState() => seccondpageState(indisi,megaveri);
}

class seccondpageState extends State<seccondpage> {

  String kitapadi1="ka";
  String yayinevi1="ya";
  String yazarlar1="ya";
  String sayfa1="0";
  String basimyili1="0";
  String kategori="Roman";
  String kategori1="Roman";
  

  late int  molindisi;
  late List veriulmega;
  
  seccondpageState(indisi,megaver){
    molindisi=indisi;
    veriulmega=megaver;
  if (veriulmega.length>3){
  kitapadi1=veriulmega[0];
  yayinevi1=veriulmega[1];
  yazarlar1=veriulmega[2];
  sayfa1=veriulmega[3];
  basimyili1=veriulmega[4];
  kategori1=veriulmega[5];}

  }
 bool? cenge=false;


 


  
  TextEditingController kitap=TextEditingController();
  TextEditingController yayinevi=TextEditingController();
  TextEditingController yazarlar=TextEditingController();
  TextEditingController sayfa=TextEditingController();
  TextEditingController basimyili=TextEditingController();


haelledici(awe){
  setState(() {
    kategori=awe;
  });

}
ondolum(){
  setState(() {
    if (veriulmega.length>3){ 
  kitap.text=kitapadi1;
  yayinevi.text=yayinevi1;
  yazarlar.text=yazarlar1;
  sayfa.text=sayfa1;
  basimyili.text=basimyili1;
  kategori=kategori1;}
  });
 
}


 
  @override
  Widget build(BuildContext context) {
    String? faew;
    return  Scaffold(
      appBar: AppBar(title: Text("Sayfa 2")),
      
      body: ListView(
        children: <Widget>[
           ListTile(
              title: Text('Önceki değerleri doldur=>'),
              trailing: IconButton(onPressed: (){ondolum();},icon: Icon(Icons.update),tooltip: "doldur",),

            
            ),

          
          ListTile(
              title: Text('Kitap adı'),
              subtitle: TextField(controller: kitap,
              ),

            
            ),
            ListTile(
              title: Text('Yayinevi'),
              subtitle: TextField(controller: yayinevi,),

            
            ),
            ListTile(
              title: Text('Yazarlar'),
              subtitle: TextField(controller: yazarlar,),

              

            
            ),


             ListTile(
              title: Text("$kategori"),
              trailing: OutlinedButton(onPressed: ()async{faew = await Navigator.push(context, MaterialPageRoute(builder: (context)=>alertDialog()));
                haelledici(faew);
                }, child: Icon(Icons.arrow_drop_down),),
            ), 
            ListTile(
              title: Text('Sayfa'),
              subtitle: TextField(controller: sayfa,keyboardType: TextInputType.number,),




            
            ),
            ListTile(
              title: Text('Basım yılı'),
              subtitle: TextField(controller: basimyili,keyboardType: TextInputType.number,),

            
            ),
            ListTile(
              title: Text("Listede yayınlanacakmı?"),
              trailing: Checkbox(value: cenge, onChanged:(alue) {setState(() {
                cenge=alue;
              });
                
              }, )
            ),
           

            ListTile(
             
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ OutlinedButton(onPressed: (){Navigator.pop(context,[0,molindisi]);
                setState(() {
                });}, child: Text("Sil"),), OutlinedButton(onPressed: (){Navigator.pop(context,[1,[kitap.text,yayinevi.text,yazarlar.text,sayfa.text,basimyili.text,kategori,cenge,molindisi]]);
                }, child: Text("Kaydet"),),],
              )
              ),
              




        ],
      
      
      ),
      );
}
}

class alertDialog extends StatefulWidget{
  @override
  State<alertDialog> createState() => _alertDialogState();
}

class _alertDialogState extends State<alertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("1ini Seçiniz"),
      content: Column(
        children: [

          ListTile(
            title: Text("Roman"),
            trailing: IconButton(onPressed:(){
              String qw="Roman";
             

              return Navigator.pop(context,qw);
            },icon: Icon(Icons.check)),

          ),
          ListTile(title: Text("Hikaye"),
            trailing: IconButton(onPressed:(){
              String qwe='Hikaye'
;
              return Navigator.pop(context,qwe);
            },icon: Icon(Icons.check)),

          ),
          ListTile(
            title: Text("Ansiklopedi"),
            trailing: IconButton(onPressed:(){
              String qwe='Ansiklopedi'
;
              return Navigator.pop(context,qwe);
            },icon: Icon(Icons.check)),

          ),
        
        
        ],


      ),


    );
  }
}
//silme butonunu==> ListTile(  title:Text("kitaplar") ,trailing: Row(children: [ IconButton.filled(onPressed: (){}, icon: Icon(Icons.edit))
 //     ,IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
  //    ]
  //    ), )==> gibi yapınca hata görünmüyordu ama uygulamayı çalıştırmıyordu o yüzden silme butonunu yanında olacağı edit butonunun içindeki uygun bir yere yerleştirdim



//firestordan veriler her listede[ kitapadı, yayınevi ,yazarlar,sayfa sayısı, basım yılı,kategori,listede yayınlanacakmı,indexi] şeklinde matris olarak read verisi gönderilir.ve bu şekilde bir listeyle update ve create eder.
//cihazımda pixel 2 api 30 a bağlanmasına rağmen run edince çalışmadığından firestoreyi deneyemedim. Flutterfire configure ile android cihazını firebaseda oluşturdum. flutter pub tüm gerekenleri import ettim. videodaki kodu da eksizsiz yazdım .
//alttaki sınıfla firestore classının çalışan taklidini yaptım ve olsaydı firestoreservisle aynı işlemleri yapıyor.
class firestoureService {
  List abstractList=[];
  ekle(List kadi){
    kadi.removeLast();
    List kadi2 = kadi;
    int indi=abstractList.length;
    kadi2.add(indi);
    abstractList.add(kadi2);
    print(abstractList);
  }
  oku(){
    return abstractList;

  }
  guncelle(int indis,List mevevi){
    abstractList[indis]=mevevi;
    print(abstractList);

  }
  yenile(){
    for(int x=0;x<abstractList.length;x++){
      print(x);
      int ikincilindis =abstractList[x].length;
      abstractList[x][ikincilindis-1]=x;
    }
  }
  sil(int indis){
    print(indis);
    abstractList.removeAt(indis);
    print(abstractList);
    print(1);
    yenile();
  }


}