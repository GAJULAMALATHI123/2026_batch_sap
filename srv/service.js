// const cds = require('@sap/cds');
// module.exports = cds.service.impl(async function () {
//     const { MCT_ControllingAreaSrv } = this.entities;
//     this.on('CreateMCT_ControllingArea', async (req) => {
//         const data = req.data;
//         const tx = cds.tx(req);
//         try {
//             const result = await tx.run(
//                 INSERT.into(MCT_ControllingAreaSrv).entries(data)
//             );
//             if (result) {
//                 return data;
//             } else {
//                 req.error(500, "Error inserting data into the database");
//             }
//         } catch (err) {
//             req.error(500, err.message);
//         }
//     });

//      this.on('updateMCT_ControllingArea',async(request,response)=>{
//         const {
//             ID,
//             Name,
//     Manager
//         }=request.data;
//         try{
//             const objTransaction=cds.tx(request);
//             await objTransaction.update(MCT_ControllingAreaSrv).with({
//                Name:Name
//             }).where({
//                 ID:ID
//             })
//             return "Successfully updated";
//         }catch(error){
//             request.error("Error: ",error)
//         }
//     })

// this.on('deleteMCT_ControllingArea',async(request,response)=>{
//         const {
//             ID
//         }=request.data;
//         try{
//             const objTransaction=cds.tx(request);
//             await objTransaction.delete(MCT_ControllingAreaSrv).where({
//                 ID:ID
//             })
//             return "Successfully deleted";
//         }catch(error){
//             request.error("Error: ",error)
//         }
//     })
//       this.on('READ', 'MCT_ControllingAreaSrv', async (req) => {

//     const employees = await SELECT.from(MCT_ControllingAreaSrv);

//     return employees;

// });
//     this.on('CreateMCT_Products', async (req) => {
//         const data = req.data;
//         const tx = cds.tx(req);
//         try {
//             const result = await tx.run(
//                 INSERT.into(MCT_ProductsSrv).entries(data)
//             );

//             if (result) {
//                 return data;
//             } else {
//                 req.error(500, "Error inserting data into the database");
//             }

//         } catch (err) {
//             req.error(500, err.message);
//         }

//     });

//      this.on('updateMCT_Products',async(request,response)=>{
//         const {
//             ID,
//             Name,
//     Manager
//         }=request.data;
//         try{
//             const objTransaction=cds.tx(request);
//             await objTransaction.update(MCT_ControllingAreaSrv).with({
//                Name:Name
//             }).where({
//                 ID:ID
//             })
//             return "Successfully updated";
//         }catch(error){
//             request.error("Error: ",error)
//         }
//     })

// this.on('deleteMCT_Products',async(request,response)=>{
//         const {
//             ID
//         }=request.data;
//         try{
//             const objTransaction=cds.tx(request);
//             await objTransaction.delete(MCT_ProductsSrv).where({
//                 ID:ID
//             })
//             return "Successfully deleted";
//         }catch(error){
//             request.error("Error: ",error)
//         }
//     })
//       this.on('READ', 'MCT_ProductsSrv', async (req) => {

//     const employees = await SELECT.from(MCT_ProductsSrv);

//     return employees;

// });
// });
























const cds = require('@sap/cds');
const { mkdirp } = require('@sap/cds/lib/utils/cds-utils');
const{uuid,exists,isdir,read}=cds.utils;
// const { uuid, exists, isdir,read } = require('@sap/cds/lib/utils/cds-utils');

module.exports = cds.service.impl(async function () {

    const { EmplSrv, PurchaseOdersrv } = this.entities;

    this.on('CreateEmployee', async (request, response) => {

        const empData = request.data;
        const objTransaction = cds.tx(request);

        let returnData = await objTransaction.run([
            INSERT.into(EmplSrv).entries(empData)
        ])
        .then((resolve, reject) => {

            if (typeof (resolve) !== 'undefined') {
                return request.data;
            } else {
                request.error(500, "Error in inserting data into the database");
            }

        })
        .catch(err => {
            request.error(500, err.toString());
        });

        return returnData;

    });


    this.on('updateEmployee', async (request, response) => {

        const {
            ID,
            salaryAmt,
            Currency_code
        } = request.data;

        try {

            const objTransaction = cds.tx(request);

            await objTransaction.update(EmplSrv)
                .with({
                    salaryAmt: salaryAmt,
                    Currency_code: Currency_code
                })
                .where({
                    ID: ID
                });

            return "Successfully updated";

        } catch (error) {

            request.error(500, error.toString());

        }

    });

    this.on('CreateAddress', async (request, response) => {

        const empData = request.data;
        const objTransaction = cds.tx(request);

        let returnData = await objTransaction.run([
            INSERT.into(AddressSrv).entries(empData)
        ])
        .then((resolve, reject) => {

            if (typeof (resolve) !== 'undefined') {
                return request.data;
            } else {
                request.error(500, "Error in inserting data into the database");
            }

        })
        .catch(err => {
            request.error(500, err.toString());
        });

        return returnData;

    });

    this.on('deleteEmployee', async (request, response) => {

        const { ID } = request.data;

        try {

            const objTransaction = cds.tx(request);

            await objTransaction.delete(EmplSrv)
                .where({
                    ID: ID
                });

            return "Successfully deleted";

        } catch (error) {

            request.error(500, error.toString());

        }

    });

    // READ

    this.on('READ', 'EmplSrv', async (req) => {

        const employees = await SELECT.from(EmplSrv);

        return employees;

    });
    const { Prodsrc } = this.entities;
   this.on('getHeighestPricedProduct', async (req) => {

    try {
        const transaction = cds.tx(req);

        const result = await transaction.read(Prodsrc)
            .orderBy({ Price: 'desc' })
            .limit(10);

        return result;

    } catch (error) {
        req.error(500, error.message);
    }
});

this.on('discountPrice', async (request,response) => {
    try{
  const ID=request.params[0];
  const transaction=cds.tx(request);
   await transaction.update(PurchaseOdersrv).with({
    Gross_amount:{
        '-=':1000
    },
    Net_amount:{
        '-=':800
    },
    Tax_amount:{
        '-=':200
    }
   }).where(ID)
   const updatePOInfo=await transaction.read(PurchaseOdersrv);
   return updatePOInfo;
} catch(error){
    return "Error: "+error.toString();
}
})
this.on('largestOrder', async (request,response) => {
    try{
  const transaction=cds.tx(request);
  const reply=await transaction.read(PurchaseOdersrv).orderBy({
    Gross_amount:'desc'
  }).limit(5);
   return reply;
} catch(error){
    return "Error: "+error.toString();
}
})

this.on('increasePrice', async (req) => {
const Node_key = req.params[0].Node_key; // Change if your key name is different
const tx = cds.tx(req);
const product = await tx.run(
SELECT.one.from(Prodsrc).where({ Node_key })
);
if (!product) {
return req.error(404, 'Product not found');
}
const newPrice = product.Price * 1.1;
await tx.run(
UPDATE(Prodsrc).set({ Price: newPrice })
.where({ Node_key })
);
return {
message: 'Price increased by 10%',
oldPrice: product.Price,
newPrice: newPrice
};
});
// Instance Bound Function
this.on('topProducts', async (req) => {
const tx = cds.tx(req);
return await tx.run(
SELECT.from(Prodsrc)
.orderBy('Price desc')
.limit(20)
);
});

//nstance Bounded Action : The employee salary should be increased by 15% using Employee Entity.
 
this.on('increaseSalary', EmplSrv, async (req) => {
    try {
        const tx = cds.tx(req);
 
        const { ID } = req.params[0]; // cuid entity key
 
        const employee = await tx.read(EmplSrv)
            .where({ ID });
 
        if (!employee.length) {
            return req.error(404, 'Employee not found');
        }
 
        const currentSalary = employee[0].salaryAmt;
        const updatedSalary = Number(currentSalary) * 1.15;
 
        await tx.update(EmplSrv)
            .set({
                salaryAmt: updatedSalary
            })
            .where({
                ID
            });
 
        return {
            message: 'Employee salary increased by 15%',
            oldSalary: currentSalary,
            newSalary: updatedSalary
        };
 
    } catch (error) {
        req.error(500, error.message);
    }
});
//Instance Bonded Function : Top 20 heighest paid employee information.
this.on('tophighpaid', EmplSrv, async (req) => {
 
        try {
 
            const tx = cds.tx(req);
 
            const result = await tx.run(
                SELECT.from(EmplSrv)
                    .orderBy({ salaryAmt: 'desc' })
                    .limit(20)
            );
 
            return result;
 
        } catch (error) {
            req.error(500, error.message);
        }
 
    });

    //Utility Variables

    this.on('getUtilities',async(request,response)=>{
        let vUUID=uuid(),vInput="%E0%A4%A8%E0%A4%AE%E0%A4%B8%E0%A5%8D%E0%A4%A4%E0%A5%87",vPackageContent=null,uri,dirExists=false,isFileExists=false;
       //exists
       if(exists('srv/test.http')){
        isFileExists=true;
       }
        //is directory exists or not
        if(isdir('app')){
            dirExists=true;
        }
        //Decode URI
        try{
            uri=decodeURI(vInput);
            await mkdirp('srv/lib')
        }catch{
            uri=vInput;
        }
        vPackageContent=await read('package.json');
        var finalValue={
            uuid:vUUID,
            uri:uri,
            dirExists:dirExists,
            packageInfo:vPackageContent
        }
        return finalValue;
    })
    // Salary Validation

    this.before('UPDATE', EmplSrv,async (req) => {

        if (req.data.salaryAmt < 10000) {
            req.error(400, 'Salary should be greater than 10000');
        }

    });
    this.before('UPDATE','PurchaseOdersrv',async(req)=>{
         const Gross_amount=req.data.Gross_amount;
         const currency_code=req.data.currency_code;
         if(currency_code=='USD' && Gross_amount>15000){
            req.error(400,'get in touch with your line manager');
         }
         if(currency_code=='EUR' && Gross_amount>10000){
            req.error(500,'get in touch with your line manager');
         }
    });

    this.before('UPDATE','AddressSrv',async(req)=>{
         const Country=req.data.Country;
         if(Country!='GB' && Country!='US'){
            req.error(400,'please contact your Administrator');
         }
    });

 

    // Duplicate Employee Check

    this.before('CreateEmployee', async (req) => {

        const employee = await SELECT.one
            .from(EmplSrv)
            .where({
                ID: req.data.ID
            });

        if (employee) {
            req.error(400, 'Employee already exists');
        }

    });

    // Get Employees

    this.on('GetEmployees', async (req) => {

        const employees = await SELECT.from(EmplSrv)
            .where({
                salaryAmt: { '>': 40000 }
            });

        return employees;

    });

    // Before Delete

    this.before('DELETE', 'EmplSrv', async (req) => {

        const employee = await SELECT.one
            .from(EmplSrv)
            .where({
                ID: req.data.ID
            });

        if (!employee) {
            req.error(404, 'Employee not found');
        }

    });

    // Phone Validation

    /*
    this.before('CreateEmployee', async (req) => {

        const phone = req.data.phoneNum;

        if (!phone) {
            req.error(400, 'Phone number is required');
        }

        if (!/^[6-9]\d{9}$/.test(phone)) {
            req.error(400, 'Invalid phone number');
        }

    });
    */

    // After Create

    this.after('CreateEmployee', async (data, req) => {

        console.log("Employee created successfully");

    });

    // Add Message

    this.after('CreateEmployee', async (data, req) => {

        data.message = "Employee created successfully";

    });

    // After READ

    this.after('READ', 'EmplSrv', (employees) => {

        employees.forEach(emp => {

            if (emp.salaryAmt > 50000) {
                emp.grade = 'A';
            } else {
                emp.grade = 'B';
            }

        });

    });

});