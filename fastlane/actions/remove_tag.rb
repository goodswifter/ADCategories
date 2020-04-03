module Fastlane
    module Actions
        module SharedValues
            REMOVE_TAG_CUSTOM_VALUE = :REMOVE_TAG_CUSTOM_VALUE
        end
        
        class RemoveTagAction < Action
            def self.run(params)
                
                # 在这写运行的代码
                
                # 属性
                tagName = params[:tag]
                isRemoveLocal = params[:is_remove_local]
                isRemoveRemote = params[:is_remove_remote]
                
                # 1. 先定义一个数组, 用来存储所有需要执行的命令
                cmds = []
                
                # 2. 往数组里面, 添加相应的命令
                # 删除本地标签
                # git tag -d 标签名称
                if isRemoveLocal
                    cmds << "git tag -d #{tagName}"
                end
                
                # 删除远程标签
                # git push origin :标签名称
                if isRemoveRemote
                    cmds << "git push origin :#{tagName}"
                end
                
                # 3. 执行数组里所有的命令
                result = Actions.sh(cmds.join('&'));
                
                return result
            end
            
            def self.description
                "删除本地和远程标签"
            end
            
            def self.details
                "选择性删除本地和远程标签"
            end
            
            def self.available_options
                [
                  FastlaneCore::ConfigItem.new(key: :tag,
                                               description: "需要删除的标签名称",
                                               is_string: true),
                  FastlaneCore::ConfigItem.new(key: :is_remove_local,
                                               description: "是否删除本地标签",
                                               is_string: false,
                                               optional: true,
                                               default_value: true),
                  FastlaneCore::ConfigItem.new(key: :is_remove_remote,
                                               description: "是否删除远程标签",
                                               is_string: false,
                                               optional: true,
                                               default_value: true)
                ]
            end
            
            def self.output
                
            end
            
            def self.return_value
                nil
            end
            
            def self.authors
                ["goodswifter"]
            end
            
            def self.is_supported?(platform)
                platform == :ios
            end
        end
    end
end
