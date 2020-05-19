json.array! @materials, partial: "materials/material", as: :material


function replaceMaterials (innerHTML) {
  const materials = document.getElementById('materials');
  materials.innerHTML = innerHTML;
}
replaceMaterials("<%= j render 'material', materials: @materials %>");
