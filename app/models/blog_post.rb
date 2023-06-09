class BlogPost < ApplicationRecord
    has_rich_text :content

    validates :title, presence: :true
    validates :content, presence: :true

    scope :sorted, -> { order(published_at: :desc, updated_at: :desc) }
    scope :draft, -> { where(published_at: nil) }
    scope :published, -> { where("published_at <= ?", Time.current) }
    scope :scheduled, -> { where("published_at > ?", Time.current) }

    def draft?
        published_at.nil?
    end

    def publish?
        published_at? && published_at <= Time.current
    end

    def schedule?
        published_at? && published_at > Time.current
    end

end
