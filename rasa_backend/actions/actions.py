from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
import firebase_admin
from firebase_admin import firestore, credentials

# Initialize Firebase
cred = credentials.Certificate("path/to/firebase-adminsdk.json")  # Replace with your service account key path
firebase_admin.initialize_app(cred)
db = firestore.client()

class ActionFetchProductInfo(Action):
    def name(self) -> Text:
        return "action_fetch_product_info"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        product_name = tracker.get_slot("product_name")
        if product_name:
            doc_ref = db.collection("products").document(product_name.lower())
            doc = doc_ref.get()
            if doc.exists:
                product_info = doc.to_dict()
                dispatcher.utter_message(text=f"Here are the details for {product_name}: {product_info['description']}.")
            else:
                dispatcher.utter_message(text=f"I couldn't find any information about {product_name}.")
        else:
            dispatcher.utter_message(text="Could you please specify the product name?")
        return []

class ActionFetchProductPrice(Action):
    def name(self) -> Text:
        return "action_fetch_product_price"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        product_name = tracker.get_slot("product_name")
        if product_name:
            doc_ref = db.collection("products").document(product_name.lower())
            doc = doc_ref.get()
            if doc.exists:
                product_data = doc.to_dict()
                price = product_data.get("price", "Not available")
                dispatcher.utter_message(text=f"The price of {product_name} is ${price}.")
            else:
                dispatcher.utter_message(text=f"I don't have pricing information for {product_name}.")
        else:
            dispatcher.utter_message(text="Could you please specify the product name?")
        return []

class ActionFetchUserPreferences(Action):
    def name(self) -> Text:
        return "action_fetch_user_preferences"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        user_id = tracker.sender_id
        doc_ref = db.collection("users").document(user_id)
        doc = doc_ref.get()
        if doc.exists:
            preferences = doc.to_dict().get("preferences", [])
            if preferences:
                dispatcher.utter_message(text=f"Based on your