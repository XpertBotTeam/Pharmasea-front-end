class Drug{
  String name;
  bool prescriptionIsRequired;
  String price;
  String expiryDate;
  String infoDescription;
  String company;
  String Image;
  String category;
  Drug({ required this.name,required this.price, required this.prescriptionIsRequired,required this.expiryDate,required this.infoDescription,required this.company,required this.Image,required this.category}); 

}
List<Drug> drugList  =[
  Drug(name: 'panadol',price:'100' , prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol description', company: 'panadol', Image: 'img/panadol.png',category: 'lung'),
  Drug(name: 'panadol2',price:'300', prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol 2 description', company: 'panadol2', Image: 'img/panadol.png',category: 'heart'),
  Drug(name: 'panadol3',price:'400', prescriptionIsRequired: true, expiryDate: '12/30/2025', infoDescription: 'this is panadol 3 description', company: 'panadol3', Image: 'img/panadol.png',category: 'lung'),
  Drug(name: 'panadol4',price:'500', prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol 4  description', company: 'panadol4', Image: 'img/panadol.png',category: 'eye'),
  Drug(name: 'panadol5',price:'1000', prescriptionIsRequired: true, expiryDate: '12/30/2025', infoDescription: 'this is panadol  5 description', company: 'panadol5', Image: 'img/panadol.png',category: 'heart'),
  Drug(name: 'panadol 6',price:'100' , prescriptionIsRequired: false, expiryDate: '12/31/2025', infoDescription: 'this is panadol 6  description', company: 'panadol6', Image: 'img/panadol.png',category: 'heart'),
  Drug(name: 'panadol 7',price:'100' , prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol description', company: 'panadol', Image: 'img/panadol.png',category: 'lung'),
  Drug(name: 'panadol 8',price:'100' , prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol description', company: 'panadol', Image: 'img/panadol.png',category: 'lung'),
  Drug(name: 'panadol 9',price:'100' , prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol description', company: 'panadol', Image: 'img/panadol.png',category: 'lung'),
  Drug(name: 'panadol 10',price:'100' , prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol description', company: 'panadol', Image: 'img/panadol.png',category: 'lung'),  
      ];