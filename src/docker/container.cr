require "./client"

class Docker::Container
  # The `Docker::Client` instance that this container exists on.
  private getter client : Client

  # The containers unique id
  getter id :  String

  def initialize(@client, @id)
  end

  def inspect
    client.inspect id
  end

  def start
    client.start id
    self
  end

  def stop(timeout = nil)
    client.stop id, timeout
    self
  end

  def restart(timeout = nil)
    client.restart id, timeout
    self
  end

  def kill(signal = nil)
    client.kill id, signal
    self
  end

  def update(**props)
    client.update id, **props
    self
  end

  def rename(name : String)
    client.rename id name
    self
  end

  def pause
    client.pause id
    self
  end

  def unpause
    client.unpause id
    self
  end

  def wait(condition = nil)
    response = client.wait id, condition
    response.status_code
  end

  def remove(v = nil, force = nil, link = nil)
    client.remove id, v, force, link
    nil
  end
end
