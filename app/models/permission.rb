class Permission
  def initialize(user)
    allow :users, [:new, :create]
    allow :sessions, [:new, :create, :destroy]
    allow :password_resets, [:new, :create, :edit, :update]
    if user
      allow :static_pages, [:home]
      allow :subjects, [:index,:new, :create]
      allow :subjects, [:show,:edit, :update, :destroy] do |subject|
        subject.owner == user.id
      end
      allow :groups, [:index]
      allow :groups, [:new, :create] do |subject|
        subject.owner == user.id
      end
      allow :groups, [:show,:edit, :update, :destroy] do |group|
        group.owner == user.id
      end
      allow :lab_classes, [:index]
      allow :lab_classes, [:new, :create] do |group|
        group.owner == user.id
      end
      allow :lab_classes, [:show,:edit, :update, :destroy] do |lab_class|
        lab_class.owner == user.id
      end
      allow :presences, [:index, :check_presence, :update_presence] do |lab_class|
        lab_class.owner == user.id
      end
      allow :presences, [:group_presence] do |group|
        group.owner == user.id
      end
      allow :students, [:index]
      allow :students, [:new, :create] do |group|
        group.owner == user.id
      end
      allow :students, [:show,:edit, :update, :destroy] do |student|
        student.owner == user.id
      end

      allow :notes, [:new, :create] do |student|
        student.owner == user.id
      end
      allow :notes, [:edit, :update, :destroy] do |note|
        note.owner == user.id
      end


      allow :marks, [:index, :new, :create] do |student|
        student.owner == user.id
      end
      allow :marks, [:edit, :update, :destroy] do |mark|
        mark.owner == user.id
      end

      allow :fmarks, [:index, :give_mark, :update_mark] do |group|
        group.owner == user.id
      end
    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end

  def allow_all
    @allow_all = true
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end


end