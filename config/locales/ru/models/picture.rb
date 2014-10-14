LocaleSupport.multi({
  :ru => {
    :picture => {
      :index => { :title => "Изображения" },
      :new => { :title => "Новое изображение" },
      :create => { :title => "Загрузить изображение" },
      :show => { :title => "Изображение %{title}" },
      :edit => { :title => "Редактировать изображение" },
      :update => { :title => "Сохранить изменения" },
      :destroy => { :confirm => "Вы уверены?" },
      :cropping => { :title => "Обрезать", :reset => "Сброс" },
      :flash => {
        :created => "Изображение загружено",
        :updated => "Изображение обновлено",
        :destroyed => "Изображение удалено"
      },
      :meta => {
        :current => "Текущее",
        :thumbnail => "Иконка",
        :original => "Оригинал",
        :cropped => "Обрезано",
        :counters => "Статистика по изображению",
        :picas => { :title => "Использовать как" }
      },
      :as => {
        :avatar => { :title => "Аватар", :use => "Аватар" },
        :logo => { :title => "Логотип", :use => "Логотип" },
        :image => { :title => "Изображение", :use => "Изображение" },
        :bg_image => { :title => "Фон", :use => "Фоновый рисунок" }
      }
    },
    :activerecord => {
      :models => {
        :picture => "Избражение"
      },
      :attributes => {
        :picture => {
          :src => "Источник",
          :description => "Описание",
          :file_size => "Размер файла",
          :used_count => "Использовано раз"
        }        
      }
    },
    :helpers => {
      :submit => {
        :picture => {
          :create => "Загрузить изображение",
          :update => "Обновить изображение"
        }
      },
      :label => {
        :picture => {
        }
      }
    }
  }
})