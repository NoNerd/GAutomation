module ApplicationHelper
        
        def create_wiki_path
                return Time.now.strftime("%Y-%M-%D")
        end
        
end
