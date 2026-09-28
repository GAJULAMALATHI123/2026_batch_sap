// namespace capapp;
// using { managed, cuid } from '@sap/cds/common';
// entity Album{
//     key Id:UUID;
//     title:String(60);
//     description:String(60);
//     view:Integer;
// }
// entity Location{
//     key Id:UUID;
//     name:String(60);
//     shortname:String(60);
// }
// entity Photo:managed,cuid{
//     key Id:UUID;
//     albumid:Association to Album;
//     locationid:Association to Location;
//     memberid:Association to Member;
//     titile:String(60);
//     description:String(60);
//     privacy:String(60);
//     Uploaddata:Localized String;
//     view:Integer;
//     imagepath:String(50); 
// }
// entity Member{
//     key Id:UUID;
//     name:String(250);
//     phonenum:String(20);
//     email:String(200);
//     address:String(255);
// }
// entity Comment{
//     key Id:UUID;
//     photoid:Association to Photo;
//     content:String(255);
// }
// entity Tag{
//     key Id:UUID;
//     titile:String(120);
// }
// entity TagPhoto{
//     key Id:UUID;
//     tagid:Association to Tag;
//     photoid:Association to Photo;
// }
