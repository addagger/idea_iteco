LocaleSupport.multi({
  :ru => {
    :upload => {
      :index => {
        :title => "Файлы",
        :add_files => "Добавить",
        :start_upload => "Начать загрузку",
        :cancel_upload => "Отменить",
        :delete => "Удалить"
      },
      :new => { :title => "Загрузка файла" },
      :create => {
        :title => "Загрузить файл",
        :start => "Загрузить",
        :cancel => "Отменить",
        :delete => "Удалить"
      },
      :show => { :title => "Файл %{title}" },
      :edit => { :title => "Обновить файл" },
      :update => { :title => "Сохранить файл" },
      :destroy => { :confirm => "Вы уверены?" },
      :download => { :button => "Загрузить" },
      :flash => {
        :created => "Файл загружен",
        :updated => "Файл загружен",
        :destroyed => "Файл удален"
      },
      :meta => {
        :counters => "Статистика по файлу",
        :origin => {
          :fileupload => "Загружено вручную",
          :editor => "Загружено через редактор"
        }
      }
    },
    :activerecord => {
      :models => {
        :upload => "Файл"
      },
      :attributes => {
        :upload => {
          :src => "Источник",
          :description => "Описание",
          :file_size => "Размер файла",
          :content_type => "Тип контента",
          :used_count => "Использовано раз"
        }        
      }
    },
    :helpers => {
      :submit => {
        :upload => {
          :create => "Загрузить файл",
          :update => "Обновить файл"
        }
      },
      :label => {
        :upload => {
        }
      }
    }
  }
})