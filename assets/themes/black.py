from __future__ import annotations

from typing import Iterable
import gradio as gr

#gr.themes.builder()
from gradio.themes.base import Base
from gradio.themes.utils import colors, fonts, sizes
import time

class Kano(Base):
    def __init__(
        self,
        *,
        primary_hue: colors.Color | str = "#87CEEB",  
        secondary_hue: colors.Color | str = "#87CEEB",  
        neutral_hue: colors.Color | str = colors.neutral,
        spacing_size: sizes.Size | str = sizes.spacing_md,
        radius_size: sizes.Size | str = sizes.radius_md,
        text_size: sizes.Size | str = sizes.text_lg,
        font: fonts.Font
        | str
        | Iterable[fonts.Font | str] = (
            'Inter V',
            fonts.GoogleFont('Inter'),
            'ui-sans-serif',
            'system-ui',
        ),
        font_mono: fonts.Font
        | str
        | Iterable[fonts.Font | str] = (
            'ui-monospace',
            fonts.GoogleFont("Roboto Mono"),
            'Consolas',
            'monospace',
        ),
    ):
        super().__init__(
            primary_hue=primary_hue,
            secondary_hue=secondary_hue,
            neutral_hue=neutral_hue,
            spacing_size=spacing_size,
            radius_size=radius_size,
            text_size=text_size,
            font=font,
            font_mono=font_mono,
        )

theme = gr.Interface.Theme(
    primary_color="#87CEEB",  
    secondary_color="#87CEEB",  
    text_color="black",
    background_color="white",
)

kano = Kano()

iface = gr.Interface(fn, inputs, outputs, theme=theme)
iface.launch()
