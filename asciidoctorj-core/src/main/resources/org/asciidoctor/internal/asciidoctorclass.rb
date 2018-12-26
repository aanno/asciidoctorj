java_import java.math.BigDecimal
java_import java.math.BigInteger

defined?(::BigDecimal) or require 'bigdecimal'

# include_package 'java.math'

module AsciidoctorJ
    include_package 'org.asciidoctor'
    # the 'api' sub-package is new (formerly not present)
    include_package 'org.asciidoctor.api'

    java_import(
        org.asciidoctor.api.Attributes,
        org.asciidoctor.api.AttributesBuilder,
        org.asciidoctor.api.CompatMode,
        org.asciidoctor.api.DirectoryWalker,
        org.asciidoctor.api.Options,
        org.asciidoctor.api.OptionsBuilder,
        org.asciidoctor.api.Placement,
        org.asciidoctor.api.SafeMode
        )

    module Ast
      include_package 'org.asciidoctor.ast'
      include_package 'org.asciidoctor.api.ast'

      java_import(
          org.asciidoctor.api.ast.Author,
          org.asciidoctor.api.ast.Block,
          org.asciidoctor.api.ast.Cell,
          org.asciidoctor.api.ast.Column,
          org.asciidoctor.api.ast.ContentModel,
          org.asciidoctor.api.ast.Cursor,
          org.asciidoctor.api.ast.DescriptionList,
          org.asciidoctor.api.ast.DescriptionListEntry,
          org.asciidoctor.api.ast.Document,
          org.asciidoctor.api.ast.DocumentHeader,
          org.asciidoctor.api.ast.List,
          org.asciidoctor.api.ast.ListItem,
          org.asciidoctor.api.ast.PhraseNode,
          org.asciidoctor.api.ast.RevisionInfo,
          org.asciidoctor.api.ast.Row,
          org.asciidoctor.api.ast.Section,
          org.asciidoctor.api.ast.StructuralNode,
          org.asciidoctor.api.ast.Table,
          org.asciidoctor.api.ast.Title
      )
    end

    module Converter
      include_package 'org.asciidoctor.converter'
      include_package 'org.asciidoctor.api.converter'

      java_import(
          org.asciidoctor.api.converter.AbstractConverter,
          org.asciidoctor.api.converter.Converter,
          org.asciidoctor.api.converter.ConverterFor,
          org.asciidoctor.api.converter.OutputFormatWriter,
          org.asciidoctor.api.converter.StringConverter
      )
    end

    # new 'Api' namespace
    module Api
        include_package 'org.asciidoctor.api'
        module Extensions
            include_package 'org.asciidoctor.api.extension'
            # Treeprocessor was renamed in to TreeProcessor in https://github.com/asciidoctor/asciidoctor/commit/f1dd816ade9db457b899581841e4cf7b788aa26d
            # This is necessary to run against both Asciidoctor 1.5.5 and 1.5.6
            TreeProcessor = Treeprocessor unless defined? TreeProcessor
        end
    end

    # old 'Extensions' namespace: should include ..extension and ..api.extension
    module Extensions
        include_package 'org.asciidoctor.extension'
        # the 'api.extension' sub-package is new (formerly not present)
        include_package 'org.asciidoctor.api.extension'
        # Treeprocessor was renamed in to TreeProcessor in https://github.com/asciidoctor/asciidoctor/commit/f1dd816ade9db457b899581841e4cf7b788aa26d
        # This is necessary to run against both Asciidoctor 1.5.5 and 1.5.6
        TreeProcessor = Treeprocessor unless defined? TreeProcessor

        java_import(
            org.asciidoctor.api.extension.BaseProcessor,
            org.asciidoctor.api.extension.BlockMacroProcessor,
            org.asciidoctor.api.extension.BlockProcessor,
            org.asciidoctor.api.extension.Contexts,
            org.asciidoctor.api.extension.DefaultAttribute,
            org.asciidoctor.api.extension.DefaultAttributes,
            org.asciidoctor.api.extension.DocinfoProcessor,
            org.asciidoctor.api.extension.ExtensionGroup,
            org.asciidoctor.api.extension.Format,
            org.asciidoctor.api.extension.FormatType,
            org.asciidoctor.api.extension.IncludeProcessor,
            org.asciidoctor.api.extension.InlineMacroProcessor,
            org.asciidoctor.api.extension.Location,
            org.asciidoctor.api.extension.LocationType,
            org.asciidoctor.api.extension.MacroProcessor,
            org.asciidoctor.api.extension.Name,
            org.asciidoctor.api.extension.PositionalAttributes,
            org.asciidoctor.api.extension.Postprocessor,
            org.asciidoctor.api.extension.Preprocessor,
            org.asciidoctor.api.extension.PreprocessorReader,
            org.asciidoctor.api.extension.Processor,
            org.asciidoctor.api.extension.Reader,
            org.asciidoctor.api.extension.Treeprocessor
        )
    end
end

require 'java'
require 'asciidoctor'
# require 'asciidoctor/api'
require 'asciidoctor/extensions'
# require 'asciidoctor/api/extensions'

module AsciidoctorModule

    def self.unregister_all_extensions()
        Asciidoctor::Extensions.unregister_all
    end

    def self.unregister_extension name
        Asciidoctor::Extensions.unregister name
    end

    def self.docinfo_processor(extensionName)
        Asciidoctor::Extensions.register do
            docinfo_processor extensionName
        end
    end

    def self.treeprocessor(extensionName)
        Asciidoctor::Extensions.register do
            treeprocessor extensionName
        end
    end
    
    def self.include_processor(extensionName)
        Asciidoctor::Extensions.register do
            include_processor extensionName
        end
    end

    def self.preprocessor(extensionName)
        Asciidoctor::Extensions.register do
            preprocessor extensionName
        end
    end
    
    def self.postprocessor(extensionName)
        Asciidoctor::Extensions.register do
            postprocessor extensionName
        end
    end

    def self.block_processor *args
        Asciidoctor::Extensions.register do
            block *args
        end
    end

    def self.block_macro *args
        Asciidoctor::Extensions.register do
            block_macro *args
        end
    end

    def self.inline_macro *args
        Asciidoctor::Extensions.register do
            inline_macro *args
        end
    end

    def self.register_extension_group(groupName, callback, registrators)
        Asciidoctor::Extensions.register groupName do
            callback.register_extensions self, registrators
        end
    end

end

module Asciidoctor
    class AbstractNode
        alias :is_attr :attr? unless method_defined? :is_attr
        alias :get_attr :attr unless method_defined? :get_attr
        alias :is_reftext :reftext? unless method_defined? :is_reftext
    end
    
    class AbstractBlock
        alias :append :<< unless method_defined? :append
    end
end
