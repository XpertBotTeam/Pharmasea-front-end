class Drug{
  String name;
  bool prescriptionIsRequired;
  String price;
  String expiryDate;
  String infoDescription;
  String company;
  String Image;
  Drug({ required this.name,required this.price, required this.prescriptionIsRequired,required this.expiryDate,required this.infoDescription,required this.company,required this.Image}); 

}
List<Drug> drugList  =[
  Drug(name: 'panadol',price:'100' , prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol description', company: 'panadol', Image: 'img/panadol.png'),
  Drug(name: 'panadol2',price:'300', prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol 2 description', company: 'panadol2', Image: 'img/panadol.png'),
  Drug(name: 'panadol3',price:'400', prescriptionIsRequired: true, expiryDate: '12/30/2025', infoDescription: 'this is panadol 3 description', company: 'panadol3', Image: 'img/panadol.png'),
    Drug(name: 'panadol4',price:'500', prescriptionIsRequired: false, expiryDate: '12/30/2025', infoDescription: 'this is panadol 4  description', company: 'panadol4', Image: 'img/panadol.png'),
  Drug(name: 'panadol5',price:'1000', prescriptionIsRequired: true, expiryDate: '12/30/2025', infoDescription: 'this is panadol  5 description', company: 'panadol5', Image: 'img/panadol.png'),
      ];