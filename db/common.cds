// namespace capapp.common;
// using {Currency} from '@sap/cds/common';
// type Guid:UUID;
// type Phonenum:String(255);
// type Email : String(255);
// type Role:String(2);
// type String32 : String(32);
// type String64:String(64);
// type String5000 : String(5000);
// type Integer64:Integer;
// type decimal:Decimal(20, 3);
// type String255:String(255);
// type String200:String(200);









// namespace capapp.common;
// using { Country, Currency } from '@sap/cds/common';
// type nameStr:String(50);

// aspect address {
//   drno:String(20);
//   street:String(50);
//   landmark:String(50);
//   city:String(100);
//   postal:Integer;
//   state:String(100);
//   country:Country;
//   region:String(20);
// }

// aspect feeasp{
//     gross_fee:Amount;
//     tax:Amount;
//     total_fee:Amount;
//     currency:Currency;
// }

// type Gender : String enum {
// Male;
// Female;
// Other;
// };

// type Status:String enum{
//     Sucess;
//     rejected;
//     approved;
// } 
// type Amount: Decimal(10,2) @(
//     semantics.amount.currencyCode:'CURRENCY_CODE',
//     sap.unit:'CURRENCY_CODE'
// );
// type PhoneNumber: String(20) @assert.format : '^(?:(?:\+|00)?91[\-\s]?)?[6-9]\d{9}$';
// type Email : String(100) @assert.format: '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';

namespace capapp.common;
using {Currency} from '@sap/cds/common';

type Guid:UUID;
type Phonenum:String(255);
type Email : String(255);
type Role:String(2);
type String32 : String(32);
type String64:String(64);
type String5000 : String(5000);
type Integer64:Integer;
type decimal:Decimal(20, 3);
type String255:String(255);
type String200:String(200);
type Gender : String enum {
Male;
Female;
Other;
};

type AmountT:Decimal(10,2) @(
    Semantics.amount.currencyCode:'CURRENCY_CODE',
    sap.unit:'CURRENCY_CODE'
);
aspect Amount{
    Gross_amount:AmountT;
    Net_amount:AmountT;
    Tax_amount:AmountT;
    currency:Currency;
}
aspect Address{
    Street:String255;
    Postal_code:String32;
    City:String255;
    Country:String255;
    Building:String255;
}


