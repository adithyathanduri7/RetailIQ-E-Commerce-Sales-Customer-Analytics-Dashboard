import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("orders.csv")

print(df.head())

revenue_by_category = (
    df.groupby('Product_Category')['Sales_Amount']
    .sum()
    .sort_values(ascending=False)
)

print(revenue_by_category)

revenue_by_category.plot(kind='bar')
plt.title("Revenue by Category")
plt.show()