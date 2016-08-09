class Parking < ApplicationRecord
    has_attached_file :image, styles: {big: '600x400>', large: '288x216>', medium: '200x200>', thumb: '48x48>' }
    do_not_validate_attachment_file_type :image
end
