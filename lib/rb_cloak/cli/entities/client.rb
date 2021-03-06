# frozen_string_literal: true

require 'clamp'

require_relative '../commands'

module RbCloak
  module Cli
    module Entities
      # Realm management command
      class ClientCommand < AbstractManageCommand
        class ListSubCommand < RealmBindAbstractSubCommand
          include Mixins::AbstractListSubMixin
          print_params :clientId
        end

        class ReadSubCommand < RealmBindAbstractSubCommand
          include Mixins::AbstractReadSubMixin
          find_param :clientId
        end

        class CreateSubCommand < RealmBindAbstractSubCommand
          include Mixins::AbstractCreateSubMixin
        end

        class UpdateSubCommand < RealmBindAbstractSubCommand
          include Mixins::AbstractUpdateSubMixin
          find_param :clientId
        end

        class DeleteSubCommand < RealmBindAbstractSubCommand
          include Mixins::AbstractDeleteSubMixin
          find_param :clientId
        end

        class SecretSubCommand < RealmBindAbstractSubCommand
          include Mixins::AbstractReadSubMixin

          def execute
            entity = find_entity.first
            puts entity.secret
          end

          find_param :clientId
        end

        load_entities
      end
    end
  end
end
