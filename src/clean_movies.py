import pandas as pd

# 1. Load raw data
# =========================
df = pd.read_csv("data/raw/movies.csv")

# 2. Select needed columns
# =========================
df = df[['title', 'genre', 'release_date', 'popularity']]

# 3. Clean release_date
# =========================
df['release_date'] = pd.to_datetime(df['release_date'], errors='coerce')
df['release_year'] = df['release_date'].dt.year

# remove rows without year
df = df.dropna(subset=['release_year'])

# 4. Filter last 5 years
# =========================
df = df[df['release_year'] >= 2020]

# 5. Clean genre
# =========================
df['genre'] = df['genre'].astype(str)
df['genre'] = df['genre'].str.split(',')
df = df.explode('genre')
df['genre'] = df['genre'].str.strip()

# 6. Remove missing values
# =========================
df = df.dropna(subset=['genre', 'popularity'])

# 7. Save cleaned data
# =========================
df.to_csv("data/processed/movies_clean.csv", index=False)

print("✅ Data cleaning finished. Output saved to data/processed/movies_clean.csv")