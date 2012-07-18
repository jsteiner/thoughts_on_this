module Upload
  def upload_text(text_content)
    within '#new_text_subject' do
      fill_in 'text_discussion_name', with: 'something'
      fill_in 'text_subject_content', with: text_content
      click_button 'Discuss'
    end
  end

  def upload_image(filename)
    within '#new_image_subject' do
      fill_in 'image_discussion_name', with: 'something'
      attach_file('image_subject_image',
                  File.join(Rails.root, "features/support/#{filename}"))
      click_button 'Discuss'
    end
  end
end

World Upload
