package beans;

import java.io.Serializable;
import java.sql.Timestamp;

//記事を表すクラス
public class Article implements Serializable{ //implements Serializableが必要
	private int id; //すべての記事で一意な番号
	private String title; //タイトル
	private String body; //本文
	private String editorId; //著者のユーザId
	private Timestamp entryDatetime; //登録日時
	private int likes;
	private boolean isPrivate;

	//カラのコンストラクタが必要
	public Article() {
	}

	public Article(int id, String title, String body, String editorId, Timestamp entryDatetime,boolean isPrivate) {
		super();
		this.id = id;
		this.title = title;
		this.body = body;
		this.editorId = editorId;
		this.entryDatetime = entryDatetime;
	}

	//idと登録日時が確定していない場合用のコンストラクタ
	public Article(String title, String body, String editorId ,boolean isPrivate) {
		this(-1, title, body, editorId, null, isPrivate);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getEditorId() {
		return editorId;
	}

	public void setEditorId(String editorId) {
		this.editorId = editorId;
	}

	public Timestamp getEntryDatetime() {
		return entryDatetime;
	}

	public void setEntryDatetime(Timestamp entryDatetime) {
		this.entryDatetime = entryDatetime;
	}
	public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }
    // Getter & Setter
    public boolean isPrivate() {
        return isPrivate;
    }

    public void setPrivate(boolean isPrivate) {
        this.isPrivate = isPrivate;
    }
}
