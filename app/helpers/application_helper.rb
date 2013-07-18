module ApplicationHelper
        
        def create_wiki_path
                return Time.now.strftime("%Y-%M-%D")
        end
        
        def  ftp_host
                return "ftp://10.57.41.120/"
        end
        
end
