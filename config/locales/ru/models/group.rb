LocaleSupport.multi({
  :ru => {
    :activerecord => {
      :models => {
        :group => "Группа"
      },
      :attributes => {
        :group => {
          :title => "Название",
          :description => "Описание",
          :permalink => "URL-ID",
          :tags => "Тэги",
          :published => "Активна?"
        }        
      },
      :errors => {
        :models => {
          :group => {
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
        :group => {
          :create => "Создать группу",
          :update => "Сохранить группу"
        }
      },
      :label => {
        :group => {
        }
      }
    }
  }
})