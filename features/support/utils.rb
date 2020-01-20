require 'hexapdf'

class ReportGenerator
    attr_accessor :doc
    attr_reader :test_name, :execution_time, :screenshot_files, :test_status
    def initialize(test_name, execution_time, screenshot_files, test_status)
        @doc = HexaPDF::Document.new
        @test_name = test_name
        @execution_time = execution_time
        @screenshot_files = screenshot_files
        @test_status = test_status
    end

    def create_document
        front_page = @doc.pages.insert(0)
        front_page.canvas.
            font('Helvetica', variant: :bold, size: 40).
            text("Test Report Document", at: [100, 600]).
            font_size(25).text("Test name: "+@test_name, at: [100, 550]).
            font_size(25).text("Execution time: #{@execution_time.to_s.slice(0,3)}s", at: [100, 500]).
            fill_color(0, 102, 204).
            rectangle(0, front_page.box.height - 50, front_page.box.width, 50).
            rectangle(0, 0, front_page.box.width, 50).
            fill
    end

    def method_name
        @screenshot_files.each do |i|
            
            image = @doc.images.add(ENV['folder_name']+i)
            iw = image.info.width.to_f
            ih = image.info.height.to_f
            page = @doc.pages.add(:A4, orientation: (ih > iw ? :portrait : :landscape))
            pw = page.box(:media).width.to_f - 72
            ph = page.box(:media).height.to_f - 72
            rw, rh = pw / iw, ph / ih
            ratio = [rw, rh].min
            iw, ih = iw * ratio, ih * ratio
            x, y = (pw - iw) / 2, (ph - ih) / 2
            page.canvas.image(image, at: [x + 36, y + 36], width: iw, height: ih)
            page.canvas.font('Helvetica', size: 15).
            text("Evidence name:"+i, at: [ih/2, 10])
         end
    end

    def save_document
        doc.write(ENV['folder_name']+'test-report.pdf')
    end

end
