const functions = require("firebase-functions");
const admin = require('firebase-admin');
const algolia = require('algoliasearch');
const { default: algoliasearch } = require("algoliasearch");



/// TODO: Add your Algolia App Id
const ALGOLIA_APP_ID = '';

/// TODO: Add your Algolia Admin Key
const ALGOLIA_ADMIN_KEY = '';

/// 
const ALGOLIA_INDEX_NAME = 'services';


admin.initializeApp(functions.config().firebase);

exports.onService = functions.firestore.document('services/{sId}').onWrite(async (snap, context) => {
    const value = snap.after.data();
    value.objectID = value.id;
    updateAloglia(value);
});

async function updateAloglia(data) {
    const newValue = snap.after.data();
    newValue.objectID = snap.id;

    var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

    var index = client.initIndex(ALGOLIA_INDEX_NAME);

    await index.saveObject(newValue);
}

exports.onBookingSuccess = functions.firestore.document('bookings/{bId}').onWrite(async (snap, context)=> {
    const value = snap.after.data();
    
});