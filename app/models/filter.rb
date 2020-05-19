class Filter < ApplicationRecord
  def search_materials

    materials = Material.all
    materials = Material.where(["brand ILIKE?", brand]) if brand.present?
    materials = Material.where(["location ILIKE?", location]) if location.present?
    materials = Material.where(["supplier ILIKE?", supplier]) if supplier.present?
    materials = Material.where(["materialtype ILIKE?", materialtype]) if materialtype.present?
    materials = Material.where(["company ILIKE?", company]) if company.present?

    if materials.present?
      return materials
    else
      materials = Material.all
    end
  end
end
