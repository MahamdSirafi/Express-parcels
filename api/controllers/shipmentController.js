const Shipment = require('../models/shipmentModel');
const AppError = require('../utils/appError');
const StorageOperations = require('../models/storageOperationsModel');
const Parcel = require('../models/parcelModel');
const handlerFactory = require('../utils/handlerFactory');
const catchAsync = require('../utils/catchAsync');
const { status } = require('../utils/enum');
exports.getShipment = handlerFactory.getOne(Shipment);
exports.createShipment = catchAsync(async (req, res, next) => {
    req.body.source_centerId = req.user.centerId;
    req.body.current_location={ longitude:82.2,
      latitude: 77.2}
    const doc = await Shipment.create(req.body);
    res.status(201).json({
      status: 'success',
      doc,
    });
  })
exports.updateShipment = handlerFactory.updateOne(Shipment);
exports.deleteShipment = handlerFactory.deleteOne(Shipment);
exports.getAllShipment = handlerFactory.getAll(Shipment);


exports.addParcelToShipment = async (req, res, next) => {
    try {
        const { shipmentId, parcelId } = req.body;

        // البحث عن الشحنة
        const shipment = await Shipment.findById(shipmentId);
        if (!shipment) {
            return res.status(404).json({ message: 'الشحنة غير موجودة' });
        }
        ة
        const thisParcel = await Parcel.findById(parcelId);
        if (!thisParcel) {
            return res.status(404).json({ message: 'الشحنة غير موجودة' });
        }
        thisParcel.status="Indelivery";
        await thisParcel.save();



        // إضافة الطرد إلى الشحنة
        shipment.parcelId.push(parcelId);
        await shipment.save();

        // تحديث تاريخ التخزين للطرد في المركز الحالي
        await StorageOperations.findOneAndUpdate(
            { parcelId }, 
            { timeOut: new Date() }, 
            { new: true }
        );

        res.status(200).json({
            status: 'success',
            message: 'تمت إضافة الطرد إلى الشحنة وتحديث عملية التخزين',
        });
    } catch (err) {
        next(err);
    }
};

    // تحديث حالة الشحنة عند التوصيل وإنشاء عمليات التخزين الجديدة

    exports.deliverShipment = async (req, res, next) => {
        try {
            const { shipmentId } = req.body;
    
            // البحث عن الشحنة
            const shipment = await Shipment.findById(shipmentId);
            if (!shipment) {
                return res.status(404).json({ message: 'الشحنة غير موجودة' });
            }
    
            // تحديث حالة الشحنة إلى "تم التوصيل"
            shipment.status = 'delivered';
            await shipment.save();
    
            // المرور على جميع الطرود وإنشاء عمليات تخزين جديدة
            const storageOperations = shipment.parcelId.map(parcelId => ({
                parcelId,
                centerId:req.user.centerId,
                timeOut: null, // العملية بدأت الآن
            }));
    
            await StorageOperations.insertMany(storageOperations);
    
            res.status(200).json({
                status: 'success',
                message: 'تم توصيل الشحنة وإنشاء عمليات التخزين الجديدة',
            });
        } catch (err) {
            next(err);
        }
    };
    exports.getAllShipmentFree=catchAsync(async(req,res,next)=>{
        const doc = await Shipment.find({ source_centerId  :req.user.centerId,status:"packing"})
        res.status(200).json({
          status: 'success',
          results: doc.length,
          doc,
        });
     
    })

    exports.getAllShipmentOutpcaking=catchAsync(async(req,res,next)=>{
        const doc = await Shipment.find({ target_centerId  :req.user.centerId,status:"indelivery"})
        res.status(200).json({
          status: 'success',
          results: doc.length,
          doc,
        });
     
    })
