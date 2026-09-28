// namespace capapp.db;
// using { capapp.common as common} from './common';
// entity V_MCT_OpportunityItems{
//     key ItemID:Integer64;
//     Opportunity:Integer64;
//     Product:common.String200;
//     Quantity:common.decimal;
//     Value:Composition of many MCT_CostCenters on Value.ca=$self;
//     Unit:common.String5000;
//     Currency:common.String5000;
//     FactAttr:common.String5000;
//     Itemstatus:Integer64;
//     ControllingArea:Integer64;
//     SendingCostCenter:Integer64;
//     ReceivingCostCenter:Integer64;
//     v_mct:Association to  MCT_Opportunities;
//     tesmstatus:Association to  MCT_ItemStatusTexts;
//     pd:Composition of many MCT_CostCenters on pd.ca=$self;
//     mcp:Association to MCT_CostCenters;
//     contrlarea:Association to MCT_ControllingArea;

// }
// entity MCT_Opportunities{
//     key OpportunityID:Integer64;
//     Salesorg:Integer64;
//     ExpectedClosingdate:Date;
//     Satus:common.String5000;
//     Responsible:Integer64;
//     Customer:Integer64;
//     sap:Association to SAP_Time_View_Dimension_days;
//     saleorgin:Composition of many MCT_SalesOrgDim on saleorgin.opp=$self;
//     emp:Association to MCT_Employees;
    
// }
// entity MCT_CostCenters{
//     key ControllingArea:Integer64;
//     key CostCenter:Integer64;
//     Name:common.String5000;
//     Responsible:Integer64;
//     Customer:Integer64;
//     cd:Association to V_MCT_OpportunityItems;
//     ca:Association to V_MCT_OpportunityItems;
//     contrl:Association to MCT_ControllingArea;
//     emple:Association to MCT_Employees;
// }
// entity MCT_Products{
//     key ID:common.String5000;
//     Name:common.String5000;
//     ProductCategory:Integer64;
//     ProductGroup:Integer64;
//     ProductManager:Integer64;
//     prodcat:Association to MCT_ProductCategories;
//     emplee:Association to MCT_Employees;
// }
// entity MCT_ItemStatusTexts{
//     key ItemStatus:Integer64;
//     key Languages:String(2);
//     Text:String(50);
//     mct:Association to V_MCT_OpportunityItems;
// }
// entity SAP_Time_View_Dimension_days{
//     key date_sql:Date;
//     date_sap:String(8);
//     dayofweek:String(2);
//     calweek:String(6);
//     month:String(2);
//     calquarter:String(5);
//     quarter:String(2);
//     year:String(4);
//     dayint:Integer;
//     sapt:Association to SAP_TIME_M_TIME_DIMENSION_TDAYS;
//     tmonth:Association to SAP_TIME_DIMENSION_TMONTHS;
//     tquarters:Association to SAP_TIME_TQUARTERS;
// }
// entity MCT_SalesOrgDim{
//     key ID:Integer64;
//     Country:String(2);
//     Currencycode:String(4);
//     opp:Association to MCT_Opportunities;
//     saletxt:Association to MCT_SalesOrgtexts;
// }
// entity MCT_ControllingArea{
//     key ID:Integer64;
//     Name:String(100);
//     Manager:Integer64;
//     employ:Association to MCT_Employees;
// }
// entity MCT_ProductCategories{
//     key ID:Integer64;
//     Name:common.String5000;
// }
// entity SAP_TIME_M_TIME_DIMENSION_TDAYS{
//   key ID:String(2);
//   description:String(50);
//   key Langu:String(6);
// }
// entity SAP_TIME_DIMENSION_TMONTHS{
//     key id:String(2);
//     description:String(50);
//     key Langu:String(6);

// }
// entity SAP_TIME_TQUARTERS{
//     key id:String(2);
//     Description:String(50);
//     key Langu:String(6);
// }
// entity MCT_SalesOrgtexts{
//     key id:Integer64;
//     Language:String(2);
//     Name:String(50);
// }
// entity MCT_Employees{
//     key id:Integer64;
//     Firstname:common.String200;
//     middlename:common.String200;
//     lastname:common.String200;
//     fullname:common.String200;
//     gender:common.String200;
//     manager:Integer64;
//     mctemp:Association to MCT_Employees;
// }





















// namespace capapp;
// using { capapp.common as common} from './common';
//  // type ![Employees]:String(50);  syntax for identifier
// using { managed,temporal} from '@sap/cds/common';
//  type namestr:String(50);     //(custom resuable)if u want to reduce the size of it,u can use this method such it wont effects other


// entity Students:common.address,common.feeasp,managed,temporal{
//    key studentId : Integer;
// studentName : common.nameStr;
// fatherName : common.nameStr;
// motherName : common.nameStr;
// contactNo : common.PhoneNumber;
// email:common.Email;
// gender:common.Gender;
// library : Association to many Libraries on library.parent = $self;
// marks : Association to many Marks on marks.student = $self;
// }
// entity Marks{
//   key markId : Integer;
// subject : String(50);
// marksObtained : Integer;
// grade : String(2);
// student : Association to Students;
// }
// entity Classes:managed,temporal{
//     key classId :Integer;
//     className :common.nameStr;
//     teacherName:common.nameStr;
// }

// entity Libraries{
//  key bookId : Integer;
// parent : Association to Students;
// Boookname : namestr;
// author : namestr;
// publish : namestr;
// }

// entity Employees{
// empId: Integer;
// empName:String(50);
// salary:String(50);
// dept:String(50);
// currency: String(50);
// city:String(50);
// country:String(50);
// division:Association to one Divisions;
// }

// entity Divisions{ 
// key divisionId:String(50);
// city:String(50);
// divisionName:String(50);
// country:String(50);
// }


namespace capapp.db;
using {cuid,Currency} from '@sap/cds/common';
using {capapp.common as common} from './common';
context master{
    entity BusinessPartners{
        key node_key:common.Guid;
        bp_role:common.Role;
        email:common.Email;
        mobile:common.Phonenum;
        Fax:common.String32;
        web:common.String255;
        bp_id:common.Guid;
        company_name:common.String255;
        AD:Association  to Addressess;
    }
    entity Addressess:common.Address{
        key Node_key:common.Guid;
        Address_type:common.String32;
        Val_start:Date;
        Val_end:Date;
        Latitude:Decimal;
        Longitude:Decimal;
        BP:Association to one BusinessPartners on BP.AD=$self;
    }
    entity Products{
        Key Node_key:common.Guid;
        Product_id:common.String32;
        Type_code:String(2);
        category:common.String32;
        Description:common.String255;
        Tax_tarif_code:Integer;
        Measure_unit:String(2);
        Weight_measure:Decimal(5,2);
        Weight_unit:String(2);
        Price:Decimal(10,2);
        Currency_code:Currency;
        Width:Decimal(5,2);
        Depth:Decimal(5,2);
        Height:Decimal(5,2);
        Dim_unit:String(2);
        Suppliers:Association to BusinessPartners;
    }
    entity Employee:cuid{
        nameFrst:common.String64;
        nameLst:common.String32;
        nameInitials:common.String32;
        nameMddle:common.String64;
        gender:common.Gender;
        language:String(2);
        loginNo:String(16);
        phoneNum:common.Phonenum;
        email:common.Email;
        currency:Currency;
        salaryAmt:common.AmountT;
        accountNo:common.AmountT;
        bankId:String(16);
        bankName:common.String64;
    }

}
context transaction {
entity PurchaseOrders : common.Amount {
key NODE_KEY : common.Guid;
PO_ID : common.Guid;
// Managed Association
PARTNER : Association to master.BusinessPartners;
LIFECYCLE_STATUS : String(1);
OVERALL_STATUS : String(1);
// Unmanaged Association
Items : Association to many PurchaseItems
on Items.PARENT = $self;
}
entity PurchaseItems : common.Amount {
key NODE_KEY : common.Guid;
// Parent Association
PARENT : Association to PurchaseOrders;
PO_ITEM_POS : Integer;
// Managed Association
PRODUCT : Association to master.Products;
}
}