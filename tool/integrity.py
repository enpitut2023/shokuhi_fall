import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore


cred = credentials.Certificate("env/firebase.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
ref = db.collection(u'shop_list')
docs = ref.stream()

for doc in docs:
    # フィールド名がshop_nameの値を表示
    print(doc.id+" : "+doc.to_dict()['shop_name'])
    # merch_listの中身をさらに取得する
    merch_ref = ref.document(doc.id).collection(u'merch_list')
    merch_docs = merch_ref.stream()
    for merch_doc in merch_docs:
        # merch_listの中身のidを表示
        print(merch_doc.id+" : "+merch_doc.to_dict()['name'])
        posted_merch_ref = ref.document(doc.id).collection(u'merch_list').document(merch_doc.id).collection(u'posted_merch_list')
        posted_merch_docs = posted_merch_ref.stream()
        count = 0
        sum_price = 0
        print("---")
        for posted_merch_doc in posted_merch_docs:
            print("count : "+str(posted_merch_doc.to_dict()['amount']) + "  " +"sum_price : " +str(posted_merch_doc.to_dict()['price']) )
            count+=1
            if posted_merch_doc.to_dict()['amount'] == 0 or posted_merch_doc.to_dict()['price'] == 0:
                sum_price += 0
                print("0除算")
                exit()
            else:
                sum_price += posted_merch_doc.to_dict()['price'] / posted_merch_doc.to_dict()['amount']
        print("---")
        print("now count : "+str(merch_doc.to_dict()['count']) + "  " +"sum_price : "+ str(merch_doc.to_dict()['sumPrice']))
        print("reall count : "+str(count)+ "  " + "sum_price : "+str(sum_price))
        print("---")
        # merch_ref.document(merch_doc.id).update({
        #     u'count': count,
        #     u'sumPrice': sum_price
        # })
    print("--------------------")
