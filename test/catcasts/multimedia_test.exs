defmodule Catcasts.MultimediaTest do
  use Catcasts.DataCase

  alias Catcasts.Multimedia

  describe "videos" do
    alias Catcasts.Multimedia.Video

    @valid_attrs %{
      duration: "some duration",
      thumbnail: "some thumbnail",
      title: "some title",
      video_id: "some video_id",
      view_count: 42
    }
    @invalid_attrs %{duration: nil, thumbnail: nil, title: nil, video_id: nil, view_count: nil}

    def video_fixture(attrs \\ %{}) do
      {:ok, video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Multimedia.create_video()

      video
    end

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Multimedia.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Multimedia.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      assert {:ok, %Video{} = video} = Multimedia.create_video(@valid_attrs)
      assert video.duration == "some duration"
      assert video.thumbnail == "some thumbnail"
      assert video.title == "some title"
      assert video.video_id == "some video_id"
      assert video.view_count == 42
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_video(@invalid_attrs)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Multimedia.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_video(video)
    end
  end
end
