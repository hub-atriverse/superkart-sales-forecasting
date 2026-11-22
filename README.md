# SuperKart Sales Forecasting – Flask API + Streamlit UI

- `backend/`  Flask API (gunicorn, port 7860) serving the tuned Random Forest pipeline (`superkart_model.joblib`)
  - `GET /` health · `POST /v1/predict` (JSON, one product) · `POST /v1/predictbatch` (CSV upload)
- `frontend/` Streamlit UI (port 8501) that calls the backend over the Docker network at `http://backend:7860`

## Run in a GitHub Codespace
```bash
bash deploy.sh
```
Then in the **PORTS** tab set 7860 and 8501 to **Public** and open the forwarded URLs.

## Test the API
```bash
curl -s -X POST "$API/v1/predict" -H "Content-Type: application/json" -d '{"Product_Weight":12.66,"Product_Sugar_Content":"Low Sugar","Product_Allocated_Area":0.027,"Product_MRP":117.08,"Store_Size":"Medium","Store_Location_City_Type":"Tier 2","Store_Type":"Supermarket Type2","Product_Id_char":"FD","Store_Age_Years":16,"Product_Type_Category":"Non Perishables"}'
curl -s -X POST "$API/v1/predictbatch" -F "file=@Batch_Data_SuperKart.csv"
```
