components {
  id: "astronaut"
  component: "/main/astronaut.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"idle\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/astronaut.atlas\"\n"
  "}\n"
  ""
}
embedded_components {
  id: "hp"
  type: "label"
  data: "size {\n"
  "  x: 128.0\n"
  "  y: 32.0\n"
  "}\n"
  "text: \"HP\"\n"
  "font: \"/assets/fonts/rus.font\"\n"
  "material: \"/builtins/fonts/label-df.material\"\n"
  ""
  position {
    y: 112.0
  }
}
embedded_components {
  id: "item"
  type: "label"
  data: "size {\n"
  "  x: 128.0\n"
  "  y: 32.0\n"
  "}\n"
  "text: \"Item\"\n"
  "font: \"/assets/fonts/rus.font\"\n"
  "material: \"/builtins/fonts/label-df.material\"\n"
  ""
  position {
    x: 128.0
    y: 80.0
  }
}
embedded_components {
  id: "props"
  type: "label"
  data: "size {\n"
  "  x: 128.0\n"
  "  y: 32.0\n"
  "}\n"
  "text: \"Props\"\n"
  "font: \"/assets/fonts/rus.font\"\n"
  "material: \"/builtins/fonts/label-df.material\"\n"
  ""
  position {
    x: 129.0
    y: 6.0
  }
}
embedded_components {
  id: "points"
  type: "label"
  data: "size {\n"
  "  x: 128.0\n"
  "  y: 32.0\n"
  "}\n"
  "text: \"\\320\\236\\321\\207\\320\\272\\320\\270\"\n"
  "font: \"/assets/fonts/rus.font\"\n"
  "material: \"/builtins/fonts/label-df.material\"\n"
  ""
  position {
    x: 128.0
    y: 112.0
  }
}
