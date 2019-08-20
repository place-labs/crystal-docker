require "crystar"

module Tools
  extend self

  # Given a directory path, roll the contents into a tarball.
  #
  # FIXME: can't seem to get Crystar working with sub-directories. Using a nasty hack that breaks
  # out into an external process to run `tar`. Temp, but works for now...
  def tar(path : String) : IO
    raise ArgumentError.new("#{path} does not exist") unless Dir.exists? path

    buf = IO::Memory.new

    # Crystar::Writer.open(buf) do |tw|
    #   Dir.cd path do
    #     Dir.glob "./**/*" do |f|
    #       puts f
    #       if File.file? f
    #         tw.add File.open f
    #       else
    #         tw.write_header Crystar::Header.new \
    #           name: f,
    #           flag: Crystar::DIR.ord.to_u8,
    #           mode: 0o644_i64
    #       end
    #     end
    #   end
    # end

    Dir.cd path do
      # NOTE: tar util will not allow output to stdout unless piped, hence the use of cat as a proxy.
      Process.run "tar -co . | cat", shell: true, output: Process::Redirect::Pipe do |process|
        # FIXME: find a neater way of doing this without the intermediate string creation.
        buf = IO::Memory.new process.output.gets_to_end
      end
    end

    buf
  end
end
