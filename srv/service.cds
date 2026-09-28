// using {capapp.db as database} from '../db/schema';
// using {capapp.common as common} from '../db/common';
// service CatalogService{
// entity V_MCT_OpportunityItemsSrv as projection on database.V_MCT_OpportunityItems;
// entity MCT_Opportunitiessrv as projection on database.MCT_Opportunities;
// entity MCT_CostCentersSrv as projection on database.MCT_CostCenters;
// entity MCT_ProductsSrv as projection on database.MCT_Products;
// entity MCT_ItemStatusTextsSrv as projection on database.MCT_ItemStatusTexts;
// entity SAP_Time_View_Dimension_daysSrv as projection on database.SAP_Time_View_Dimension_days;
// entity MCT_SalesOrgDimSrv as projection on database.MCT_SalesOrgDim;
// entity MCT_ControllingAreaSrv as projection on database.MCT_ControllingArea;
// entity MCT_ProductCategoriesSrv as projection on database.MCT_ProductCategories;
// entity SAP_TIME_M_TIME_DIMENSION_TDAYSSrv as projection on database.SAP_TIME_M_TIME_DIMENSION_TDAYS;
// entity SAP_TIME_DIMENSION_TMONTHSSrv as projection on database.SAP_TIME_DIMENSION_TMONTHS;
// entity SAP_TIME_TQUARTERSSrv as projection on database.SAP_TIME_TQUARTERS;
// entity MCT_SalesOrgtextsSrv as projection on database.MCT_SalesOrgtexts;
// entity MCT_EmployeesSrv as projection on database.MCT_Employees;


//  action CreateMCT_ControllingArea(
//     ID:Integer64,
//     Name:String(100),
//     Manager:Integer64
// ) returns array of String;
// action CreateMCT_CostCenters(
//     ControllingArea:Integer64,
//      CostCenter:Integer64,
//     Name:common.String5000,
//     Responsible:Integer64,
//     Customer:Integer64,
// ) returns array of MCT_CostCentersSrv;
// action CreateMCT_Employees(
//      id:Integer64,
//     Firstname:common.String200,
//     middlename:common.String200,
//     lastname:common.String200,
//     fullname:common.String200,
//     gender:common.String200,
//     manager:Integer64,
// ) returns array of MCT_EmployeesSrv;
// action CreateMCT_ItemStatusTexts(
//      ItemStatus:Integer64,
//      Languages:String(2),
//     Text:String(50)
// ) returns array of MCT_ItemStatusTextsSrv;

// action CreateMCT_Opportunities(
//     OpportunityID:Integer64,
//     Salesorg:Integer64,
//     ExpectedClosingdate:Date,
//     Satus:common.String5000,
//     Responsible:Integer64,
//     Customer:Integer64
// ) returns array of MCT_Opportunitiessrv;

// action CreateV_MCT_OpportunityItems(
//     ItemID:Integer64,
//     Opportunity:Integer64,
//     Product:common.String200,
//     Quantity:common.decimal,
//     Unit:common.String5000,
//     Currency:common.String5000,
//     FactAttr:common.String5000,
//     Itemstatus:Integer64,
//     ControllingArea:Integer64,
//     SendingCostCenter:Integer64,
//     ReceivingCostCenter:Integer64
// ) returns array of V_MCT_OpportunityItemsSrv;
// action CreateMCT_ProductCategoriess(
//     ID:Integer64,
//     Name:common.String5000
// ) returns array of MCT_ProductCategoriesSrv;

// action CreateMCT_Products(
//     ID:common.String5000,
//     Name:common.String5000,
//     ProductCategory:Integer64,
//     ProductGroup:Integer64,
//     ProductManager:Integer64
// ) returns array of MCT_ProductsSrv;
// action CreateMCT_SalesOrgtexts(
//     id:Integer64,
//     Language:String(2),
//     Name:String(50)
// ) returns array of MCT_SalesOrgtextsSrv;
// action CreateMCT_SalesOrgDim(
//     ID:Integer64,
//     Country:String(2),
//     Currencycode:String(4)
// ) returns array of MCT_SalesOrgDimSrv;

// action updateMCT_ControllingArea(
//     ID:Integer64,
//     Name:String(100),
//     Manager:Integer64
// )returns String;
// action deleteMCT_ControllingArea(
//     ID:Integer64
// )returns String;


// // action updateEmployee(
// //     ID:UUID,
// //     salaryAmt:common.AmountT,
// //     Currency_code:String
// // )returns String;

// // action CreateAddress(
// //      Node_key:common.Guid,
// //         Address_type:common.String32,
// //         Val_start:Date,
// //         Val_end:Date,
// //         Latitude:Decimal,
// //         Longitude:Decimal,
// //         Street:common.String255,
// //     Postal_code:common.String32,
// //     City:common.String255,
// //     Country:common.String255,
// //     Building:common.String255,
// // ) returns array of AddressSrv;

// // action deleteEmployee(
// //     ID:UUID
// // )returns String;

// // action GetEmployees() returns array of EmplSrv;
// }


using {capapp.db as database} from '../db/schema';
using {capapp.common as common} from '../db/common';
service CatalogService{
    //master data which is in Master Context
// @Capabilities:{
//     InsertRestrictions.Insertable:true,
//     UpdateRestrictions.Updatable:true,
//     DeleteRestrictions.Deletable:true,
//     ReadRestrictions.Readable:false
// }
entity EmplSrv as projection on database.master.Employee{
    *
}actions{
    action increaseSalary() returns array of EmplSrv;
    function tophighpaid() returns array of EmplSrv;
};
entity Prodsrc as projection on database.master.Products{
    *
}actions{
    action increasePrice() returns array of Prodsrc;
// Instance Bounded Function
function topProducts() returns array of Prodsrc;
};
entity BusinesPartnerSrv as projection on database.master.BusinessPartners;
entity AddressSrv as projection on database.master.Addressess;
//transactional data which is in transaction context
entity PurchaseOdersrv as projection on database.transaction.PurchaseOrders{
    *
}actions{
    //declare instance bounded action
    action discountPrice() returns array of PurchaseOdersrv;
    //declare instance bounded function
    action largestOrder() returns array of PurchaseOdersrv;

};
entity PurchaseItmsrv as projection on database.transaction.PurchaseItems;

action CreateEmployee(Currency_code:String(3),
                    ID:UUID,
                    accountNumber:common.String32,
                    bankId:String(16),
                    bankName:common.String64,
                    email:common.Email,
                    gender:common.Gender,
                    language:String(2),
                    loginName:String(16),
                    nameFirst:common.String64,
                    nameInitials:common.String64,
                    nameLast:common.String64,
                    nameMiddle:common.String64,
                    phoneNumber:common.Phonenum,
                    salaryAmt:common.AmountT

) returns array of EmplSrv;

action updateEmployee(
    ID:UUID,
    salaryAmt:common.AmountT,
    Currency_code:String
)returns String;

action CreateAddress(
     Node_key:common.Guid,
        Address_type:common.String32,
        Val_start:Date,
        Val_end:Date,
        Latitude:Decimal,
        Longitude:Decimal,
        Street:common.String255,
    Postal_code:common.String32,
    City:common.String255,
    Country:common.String255,
    Building:common.String255,
) returns array of AddressSrv;

action deleteEmployee(
    ID:UUID
)returns String;
//custom functions
action GetEmployees() returns array of EmplSrv;
action getHeighestPricedProduct() returns array of Prodsrc;
 //custom function
 function getUtilities() returns String;

}