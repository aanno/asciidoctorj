java_import java.math.BigDecimal
java_import java.math.BigInteger

defined?(::BigDecimal) or require 'bigdecimal'

# include_package 'java.math'

module AsciidoctorJ
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

    # include_package 'org.asciidoctor'
    # the 'api' sub-package is new (formerly not present)
    # include_package 'org.asciidoctor.api'

=begin
    Attributes = org.asciidoctor.api.Attributes
    AttributesBuilder = org.asciidoctor.api.AttributesBuilder
    CompatMode = org.asciidoctor.api.CompatMode
    DirectoryWalker = org.asciidoctor.api.DirectoryWalker
    Options = org.asciidoctor.api.Options
    OptionsBuilder = org.asciidoctor.api.OptionsBuilder
    Placement = org.asciidoctor.api.Placement
    SafeMode = org.asciidoctor.api.SafeMode

    org.asciidoctor.Attributes = org.asciidoctor.api.Attributes
    org.asciidoctor.AttributesBuilder = org.asciidoctor.api.AttributesBuilder
    org.asciidoctor.CompatMode = org.asciidoctor.api.CompatMode
    org.asciidoctor.DirectoryWalker = org.asciidoctor.api.DirectoryWalker
    org.asciidoctor.Options = org.asciidoctor.api.Options
    org.asciidoctor.OptionsBuilder = org.asciidoctor.api.OptionsBuilder
    org.asciidoctor.Placement = org.asciidoctor.api.Placement
    org.asciidoctor.SafeMode = org.asciidoctor.api.SafeMode
=end

    # old 'Extensions' namespace: should include ..extension and ..api.extension
    module Extensions
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

        # include_package 'org.asciidoctor.extension'
        # the 'api.extension' sub-package is new (formerly not present)
        # include_package 'org.asciidoctor.api.extension'

        # Treeprocessor was renamed in to TreeProcessor in https://github.com/asciidoctor/asciidoctor/commit/f1dd816ade9db457b899581841e4cf7b788aa26d
        # This is necessary to run against both Asciidoctor 1.5.5 and 1.5.6
        TreeProcessor = Treeprocessor unless defined? TreeProcess

=begin
        BaseProcessor = org.asciidoctor.api.extension.BaseProcessor
        BlockMacroProcessor = org.asciidoctor.api.extension.BlockMacroProcessor
        BlockProcessor = org.asciidoctor.api.extension.BlockProcessor
        Contexts = org.asciidoctor.api.extension.Contexts
        DefaultAttribute = org.asciidoctor.api.extension.DefaultAttribute
        DefaultAttributes = org.asciidoctor.api.extension.DefaultAttributes
        DocinfoProcessor = org.asciidoctor.api.extension.DocinfoProcessor
        ExtensionGroup = org.asciidoctor.api.extension.ExtensionGroup
        Format = org.asciidoctor.api.extension.Format
        FormatType = org.asciidoctor.api.extension.FormatType
        IncludeProcessor = org.asciidoctor.api.extension.IncludeProcessor
        InlineMacroProcessor = org.asciidoctor.api.extension.InlineMacroProcessor
        Location = org.asciidoctor.api.extension.Location
        LocationType = org.asciidoctor.api.extension.LocationType
        MacroProcessor = org.asciidoctor.api.extension.MacroProcessor
        Name = org.asciidoctor.api.extension.Name
        PositionalAttributes = org.asciidoctor.api.extension.PositionalAttributes
        Postprocessor = org.asciidoctor.api.extension.Postprocessor
        Preprocessor = org.asciidoctor.api.extension.Preprocessor
        PreprocessorReader = org.asciidoctor.api.extension.PreprocessorReader
        Processor = org.asciidoctor.api.extension.Processor
        Reader = org.asciidoctor.api.extension.Reader
        Treeprocessor = org.asciidoctor.api.extension.Treeprocessor

        org.asciidoctor.extension.BaseProcessor = org.asciidoctor.api.extension.BaseProcessor
        org.asciidoctor.extension.BlockMacroProcessor = org.asciidoctor.api.extension.BlockMacroProcessor
        org.asciidoctor.extension.BlockProcessor = org.asciidoctor.api.extension.BlockProcessor
        org.asciidoctor.extension.Contexts = org.asciidoctor.api.extension.Contexts
        org.asciidoctor.extension.DefaultAttribute = org.asciidoctor.api.extension.DefaultAttribute
        org.asciidoctor.extension.DefaultAttributes = org.asciidoctor.api.extension.DefaultAttributes
        org.asciidoctor.extension.DocinfoProcessor = org.asciidoctor.api.extension.DocinfoProcessor
        org.asciidoctor.extension.ExtensionGroup = org.asciidoctor.api.extension.ExtensionGroup
        org.asciidoctor.extension.Format = org.asciidoctor.api.extension.Format
        org.asciidoctor.extension.FormatType = org.asciidoctor.api.extension.FormatType
        org.asciidoctor.extension.IncludeProcessor = org.asciidoctor.api.extension.IncludeProcessor
        org.asciidoctor.extension.InlineMacroProcessor = org.asciidoctor.api.extension.InlineMacroProcessor
        org.asciidoctor.extension.Location = org.asciidoctor.api.extension.Location
        org.asciidoctor.extension.LocationType = org.asciidoctor.api.extension.LocationType
        org.asciidoctor.extension.MacroProcessor = org.asciidoctor.api.extension.MacroProcessor
        org.asciidoctor.extension.Name = org.asciidoctor.api.extension.Name
        org.asciidoctor.extension.PositionalAttributes = org.asciidoctor.api.extension.PositionalAttributes
        org.asciidoctor.extension.Postprocessor = org.asciidoctor.api.extension.Postprocessor
        org.asciidoctor.extension.Preprocessor = org.asciidoctor.api.extension.Preprocessor
        org.asciidoctor.extension.PreprocessorReader = org.asciidoctor.api.extension.PreprocessorReader
        org.asciidoctor.extension.Processor = org.asciidoctor.api.extension.Processor
        org.asciidoctor.extension.Reader = org.asciidoctor.api.extension.Reader
        org.asciidoctor.extension.Treeprocessor = org.asciidoctor.api.extension.Treeprocessor
=end
    end

    module Ast
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

      include_package 'org.asciidoctor.ast'
      include_package 'org.asciidoctor.api.ast'
    end

    module Converter
      java_import(
          org.asciidoctor.api.converter.AbstractConverter,
          org.asciidoctor.api.converter.Converter,
          org.asciidoctor.api.converter.ConverterFor,
          org.asciidoctor.api.converter.OutputFormatWriter,
          org.asciidoctor.api.converter.StringConverter
      )

      include_package 'org.asciidoctor.converter'
      include_package 'org.asciidoctor.api.converter'
    end

    # new 'Api' namespace
    module Api
      include_package 'org.asciidoctor.api'
      module Extensions
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

        include_package 'org.asciidoctor.api.extension'

        # Treeprocessor was renamed in to TreeProcessor in https://github.com/asciidoctor/asciidoctor/commit/f1dd816ade9db457b899581841e4cf7b788aa26d
        # This is necessary to run against both Asciidoctor 1.5.5 and 1.5.6
        TreeProcessor = Treeprocessor unless defined? TreeProcessor
      end
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
