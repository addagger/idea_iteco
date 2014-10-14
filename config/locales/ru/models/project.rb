LocaleSupport.multi({
  :ru => {
    :activerecord => {
      :models => {
        :project => "Проект"
      },
      :attributes => {
        :project => {
          :category_ids => "Категории",
          :group_ids => "Группы",
          :title => "Название",
          :description => "Описание",
          :permalink => "URL-ID",
          :tags => "Тэги",
          :published => "Активен?"
        }        
      },
      :errors => {
        :models => {
          :project => {
            :attributes => {
              :description => {
                :blank => "должно быть указано"
              }
            }
          }
        }
      }
    },
    :helpers => {
      :submit => {
        :project => {
          :create => "Создать проект",
          :update => "Сохранить проект"
        }
      },
      :label => {
        :project => {
        }
      }
    }
  }
})