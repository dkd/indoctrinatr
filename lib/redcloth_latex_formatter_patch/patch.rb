require 'redcloth'

module RedCloth
  module Formatters
    module LATEX
      { h1: 'chapter',
        h2: 'section',
        h3: 'subsection',
        h4: 'subsubsection'
      }.each do |m, tag|
        define_method(m) do |opts|
          case opts[:align]
          when 'left' then
            "\\begin{flushleft}\\#{tag}{#{opts[:text]}}\\end{flushleft}\n\n"
          when 'right' then
            "\\begin{flushright}\\#{tag}{#{opts[:text]}}\\end{flushright}\n\n"
          when 'center' then
            "\\begin{center}\\#{tag}{#{opts[:text]}}\\end{center}\n\n"
          else
            "\\#{tag}{#{opts[:text]}}\n\n"
          end
        end
      end

      def del opts
        "\\st{#{opts[:text]}}"
      end

      def table_close _opts
        output = "\\begin{tabu}{ #{'l ' * @table[0].size}}\n"
        output << "    #{@table[0].join(' & ')} \\\\\n"
        output << "    \\tabletoprule\n"
        @table[1..-1].each do |row|
          output << "    #{row.join(' & ')} \\\\\n"
        end
        output << "    \\tablebottomrule\n\\end{tabu}\n"
        output
      end
    end
  end
end
