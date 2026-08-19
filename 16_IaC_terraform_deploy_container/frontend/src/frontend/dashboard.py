import streamlit as st
import pandas as pd
import httpx
import os

BASE_URL = os.getenv("BACKEND_URL", "http://127.0.0.1:8000")


def layout():
    st.markdown("# PokeDash")

    st.write(BASE_URL)
    stats = httpx.get(f"{BASE_URL}/pokemons/stats", timeout=30).json()
    df = pd.DataFrame(stats)

    st.markdown("All cool stuffs u need 2 know abt pokes")

    st.markdown("## Poketypes")
    pokemons_per_type = httpx.get(f"{BASE_URL}/pokemons/number_types").json()

    pokemons_per_type = pd.DataFrame(
        list(pokemons_per_type.items()), columns=["type", "number"]
    )

    st.bar_chart(pokemons_per_type.head(8), x="type", y="number")

    types = df["Type 1"].unique()
    poke_type = st.selectbox(label="Choose pokemon type", options=types)

    poke_types = httpx.get(
        f"{BASE_URL}/pokemons/type?poke_type={poke_type}", timeout=30
    ).json()

    st.dataframe(poke_types)

    st.markdown("Pokemon stats")
    st.dataframe(df)


if __name__ == "__main__":
    layout()
