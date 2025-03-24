const Shipment = require('../models/shipmentModel');
const AppError = require('../utils/appError');
const handlerFactory = require('../utils/handlerFactory');
const catchAsync = require('../utils/catchAsync');
exports.getShipment = handlerFactory.getOne(Shipment);
exports.createShipment = handlerFactory.createOne(Shipment);
exports.updateShipment = handlerFactory.updateOne(Shipment);
exports.deleteShipment = handlerFactory.deleteOne(Shipment);
exports.getAllShipment = handlerFactory.getAll(Shipment);
const StorageOperations = require('../models/storageOperationsModel');
// إضافة طرد إلى شحنة وتحديث التخزين
const Parcel = require('../models/parcelModel');

exports.addParcelToShipment = async (req, res, next) => {
    try {
        const { shipmentId, parcelId } = req.body;

        // البحث عن الشحنة
        const shipment = await Shipment.findById(shipmentId);
        if (!shipment) {
            return res.status(404).json({ message: 'الشحنة غير موجودة' });
        }

        // إضافة الطرد إلى الشحنة
        shipment.parcels.push(parcelId);
        await shipment.save();

        // تحديث تاريخ التخزين للطرد في المركز الحالي
        await StorageOperation.findOneAndUpdate(
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
            const { shipmentId, centerId, employeeId } = req.body;
    
            // البحث عن الشحنة
            const shipment = await Shipment.findById(shipmentId);
            if (!shipment) {
                return res.status(404).json({ message: 'الشحنة غير موجودة' });
            }
    
            // تحديث حالة الشحنة إلى "تم التوصيل"
            shipment.status = 'delivered';
            await shipment.save();
    
            // المرور على جميع الطرود وإنشاء عمليات تخزين جديدة
            const storageOperations = shipment.parcels.map(parcelId => ({
                parcelId,
                centerId,
                employeeId,
                timeOut: null, // العملية بدأت الآن
            }));
    
            await StorageOperation.insertMany(storageOperations);
    
            res.status(200).json({
                status: 'success',
                message: 'تم توصيل الشحنة وإنشاء عمليات التخزين الجديدة',
            });
        } catch (err) {
            next(err);
        }
    };
    